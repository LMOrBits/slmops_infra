resource "google_storage_bucket" "ml_artifacts" {
  name          = "${var.project_id}-ml-artifacts"
  location      = var.location
  force_destroy = var.env == "prod" ? false : true

  uniform_bucket_level_access = true

  versioning {
    enabled = var.env == "prod" ? true : false
  }

  project = var.project_id // Added project field
}


resource "google_storage_bucket" "data_instructed" {
  name          = "${var.project_id}-data-instructed"
  location      = var.location
  force_destroy = var.env == "prod" ? false : true

  uniform_bucket_level_access = true

  versioning {
    enabled = var.env == "prod" ? true : false
  }

  project = var.project_id // Added project field
}

resource "google_storage_bucket" "data_uninstructed" {
  name          = "${var.project_id}-data-uninstructed"
  location      = var.location
  force_destroy = var.env == "prod" ? false : true

  uniform_bucket_level_access = true

  versioning {
    enabled = var.env == "prod" ? true : false
  }

  project = var.project_id // Added project field
}
