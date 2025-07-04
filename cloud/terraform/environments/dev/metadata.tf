resource "local_file" "admin_key" {
  content  = base64decode(module.iam.storage_admin_key)
  filename = "./keys/storage-admin-key.json"
}

resource "local_file" "user_key" {
  content  = base64decode(module.iam.storage_user_key)
  filename = "./keys/storage-user-key.json"
}

resource "local_file" "super_admin_key" {
  content  = base64decode(module.iam.super_admin)
  filename = "./keys/super-admin-key.json"
}

# Create metadata directory if it doesn't exist
resource "local_file" "metadata_directory" {
  filename = "metadata/.keep"
  content  = ""

  provisioner "local-exec" {
    command = "mkdir -p metadata/storages metadata/compute"
  }
}

# Create directory for SSH keys if it doesn't exist
resource "null_resource" "ssh_key_directory" {
  provisioner "local-exec" {
    command = "mkdir -p keys"
  }
}

# # Generate SSH key pair if it doesn't exist
# resource "null_resource" "generate_ssh_key" {
#   provisioner "local-exec" {
#     command = <<-EOT
#       if [ ! -f keys/instance_ssh ]; then
#         ssh-keygen -t rsa -b 4096 -f keys/instance_ssh -N ''
#       fi
#     EOT
#   }

#   depends_on = [null_resource.ssh_key_directory]
# }

# # Read the generated public key
# data "local_file" "ssh_public_key" {
#   filename   = "keys/instance_ssh.pub"
#   depends_on = [null_resource.generate_ssh_key]
# }

# Create storage metadata file
resource "local_file" "storage_metadata" {
  filename = "metadata/storages/buckets.json"
  content = jsonencode({
    ml_artifacts = {
      name     = module.storage.ml_artifacts_bucket.name
      url      = module.storage.ml_artifacts_bucket.url
      location = module.storage.ml_artifacts_bucket.location
      project  = module.storage.ml_artifacts_bucket.project
      admin_sa = module.iam.storage_admin_email
      user_sa  = module.iam.storage_user_email
    }
    data_instructed = {
      name     = module.storage.data_instructed_bucket.name
      url      = module.storage.data_instructed_bucket.url
      location = module.storage.data_instructed_bucket.location
      project  = module.storage.data_instructed_bucket.project
      admin_sa = module.iam.storage_admin_email
      user_sa  = module.iam.storage_user_email
    }
    data_uninstructed = {
      name     = module.storage.data_uninstructed_bucket.name
      url      = module.storage.data_uninstructed_bucket.url
      location = module.storage.data_uninstructed_bucket.location
      project  = module.storage.data_uninstructed_bucket.project
      admin_sa = module.iam.storage_admin_email
      user_sa  = module.iam.storage_user_email
    }
  })

  depends_on = [local_file.metadata_directory]
}

# Create individual YAML files for each bucket
resource "local_file" "ml_artifacts_yaml" {
  filename = "metadata/storages/ml_artifacts.yaml"
  content = yamlencode({
    name     = module.storage.ml_artifacts_bucket.name
    url      = module.storage.ml_artifacts_bucket.url
    location = module.storage.ml_artifacts_bucket.location
    project  = module.storage.ml_artifacts_bucket.project
    admin_sa = module.iam.storage_admin_email
    user_sa  = module.iam.storage_user_email
  })

  depends_on = [local_file.metadata_directory]
}

resource "local_file" "data_instructed_yaml" {
  filename = "metadata/storages/data_instructed.yaml"
  content = yamlencode({
    name     = module.storage.data_instructed_bucket.name
    url      = module.storage.data_instructed_bucket.url
    location = module.storage.data_instructed_bucket.location
    project  = module.storage.data_instructed_bucket.project
    admin_sa = module.iam.storage_admin_email
    user_sa  = module.iam.storage_user_email
  })

  depends_on = [local_file.metadata_directory]
}

resource "local_file" "data_uninstructed_yaml" {
  filename = "metadata/storages/data_uninstructed.yaml"
  content = yamlencode({
    name     = module.storage.data_uninstructed_bucket.name
    url      = module.storage.data_uninstructed_bucket.url
    location = module.storage.data_uninstructed_bucket.location
    project  = module.storage.data_uninstructed_bucket.project
    admin_sa = module.iam.storage_admin_email
    user_sa  = module.iam.storage_user_email
  })

  depends_on = [local_file.metadata_directory]
}

# Create artifact store metadata file
resource "local_file" "artifact_store_metadata" {
  filename = "metadata/storages/artifact_store.json"
  content = jsonencode({
    name     = module.artifact_registry[0].artifact_store.name
    url      = module.artifact_registry[0].artifact_store.url
    location = module.artifact_registry[0].artifact_store.location
    project  = module.artifact_registry[0].artifact_store.project
  })

  depends_on = [local_file.metadata_directory]
}

# Create individual YAML file for artifact store
resource "local_file" "artifact_store_yaml" {
  filename = "metadata/storages/artifact_store.yaml"
  content = yamlencode({
    name     = module.artifact_registry[0].artifact_store.name
    url      = module.artifact_registry[0].artifact_store.url
    location = module.artifact_registry[0].artifact_store.location
    project  = module.artifact_registry[0].artifact_store.project
  })

  depends_on = [local_file.metadata_directory]
}


