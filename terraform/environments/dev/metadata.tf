
resource "local_file" "admin_key" {
  content  = base64decode(module.iam.storage_admin_key)
  filename = "./keys/storage-admin-key.json"
}

resource "local_file" "user_key" {
  content  = base64decode(module.iam.storage_user_key)
  filename = "./keys/storage-user-key.json"
}

# Create metadata directory if it doesn't exist
resource "local_file" "metadata_directory" {
  filename = "metadata/.keep"
  content  = ""

  provisioner "local-exec" {
    command = "mkdir -p metadata/storages"
  }
}

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
