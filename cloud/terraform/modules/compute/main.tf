locals {
  instances = fileexists(var.instances_config) && length(trimspace(regex("[^#]", file(var.instances_config)))) > 0 ? yamldecode(file(var.instances_config)) : {}
}

resource "google_compute_instance" "vm" {
  for_each = local.instances

  name                      = each.key
  machine_type              = each.value.machine_type
  zone                      = each.value.zone
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }

  network_interface {
    subnetwork = var.subnet_id
    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    ssh-keys = try(
      "${each.value.ssh_user}:${file("${path.root}/keys/id_rsa.pub")}",
      "ERROR: SSH key file ${each.value.ssh_key_file} not found in keys directory. Please generate it first."
    )
  }

  tags = ["k3s"]
}

# Separate the k3s installation into its own resource
resource "null_resource" "k3s_installer" {
  for_each = local.instances

  depends_on = [
    google_compute_instance.vm,
    local_file.k3s_install_script
  ]

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = each.value.ssh_user
      private_key = file("${path.root}/keys/id_rsa")
      host        = google_compute_instance.vm[each.key].network_interface[0].access_config[0].nat_ip
    }

    source      = "${path.module}/scripts/k3s_install_${can(regex("^master", each.key)) ? each.key : "agent"}.sh"
    destination = "/tmp/k3s_install.sh"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = each.value.ssh_user
      private_key = file("${path.root}/keys/id_rsa")
      host        = google_compute_instance.vm[each.key].network_interface[0].access_config[0].nat_ip
    }

    inline = [
      "chmod +x /tmp/k3s_install.sh",
      "/tmp/k3s_install.sh"
    ]
  }
}

resource "random_password" "k3s_token" {
  length  = 48
  special = false
}

resource "local_file" "k3s_install_script" {
  for_each = local.instances

  filename = "${path.module}/scripts/k3s_install_${can(regex("^master", each.key)) ? each.key : "agent"}.sh"
  content = templatefile("${path.module}/templates/k3s_install_${can(regex("^master", each.key)) ? "master" : "agent"}.sh.tpl", {
    node_type = can(regex("^master", each.key)) ? "master" : "agent"
    node_name = each.key
    k3s_token = random_password.k3s_token.result
    master_ip = google_compute_instance.vm["master"].network_interface[0].network_ip
  })
}

# Generate SSH config for easy access
resource "local_file" "ssh_config" {
  content = templatefile("${path.module}/templates/ssh_config.tpl", {
    instances = {
      for name, instance in google_compute_instance.vm : name => {
        host = instance.network_interface[0].access_config[0].nat_ip
        user = local.instances[name].ssh_user
      }
    }
  })
  filename = "${path.root}/keys/ssh_config"
}

resource "google_project_service" "compute_api" {
  project = var.project_id
  service = "compute.googleapis.com"

  disable_dependent_services = true
  disable_on_destroy         = false
}
