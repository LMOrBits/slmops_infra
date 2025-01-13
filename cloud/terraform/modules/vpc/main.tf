resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  network       = google_compute_network.vpc.id
  region        = var.region
}

resource "google_compute_firewall" "allow_ssh" {
  name        = "${var.vpc_name}-allow-ssh"
  network     = google_compute_network.vpc.id
  description = "Allow SSH access from specified IP ranges"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Replace with your allowed IP ranges
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_internal" {
  name        = "${var.vpc_name}-allow-internal"
  network     = google_compute_network.vpc.id
  description = "Allow internal communication between instances"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  # This targets all instances with the tag "minimal-instance"
  target_tags   = ["k3s"]
  source_ranges = [var.subnet_cidr]
  # Only allow traffic from other instances with the same tag
  source_tags = ["k3s"]
}

resource "google_compute_firewall" "k3s" {
  name        = "${var.vpc_name}-k3s-ports"
  network     = google_compute_network.vpc.id
  description = "Allow k3s cluster communication"

  allow {
    protocol = "tcp"
    ports    = ["6443", "10250", "2379", "2380", "8472"]
  }

  allow {
    protocol = "udp"
    ports    = ["8472"]
  }

  allow {
    protocol = "icmp"
  }

  # Restrict to your cluster's IP range
  source_ranges = [var.subnet_cidr]
  target_tags   = ["k3s"]
}
