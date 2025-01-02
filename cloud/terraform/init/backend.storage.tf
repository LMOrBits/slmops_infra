# Provider configuration
provider "google" {
  project = var.project_id
  region  = var.region
}

# Variables
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The default GCP region"
  type        = string
  default     = "europe-north1"
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

# State bucket
resource "google_storage_bucket" "terraform_state" {
  name          = "tf-state-${var.project_id}-${var.environment}"
  location      = "EU"
  force_destroy = false

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true

  # Enhanced lifecycle rules
  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }

  lifecycle_rule {
    condition {
      age                = 90
      num_newer_versions = 3
    }
    action {
      type = "Delete"
    }
  }

  # Security settings
  public_access_prevention = "enforced"


  # Labels for better resource management
  labels = {
    environment = var.environment
    managed_by  = "terraform"
    purpose     = "terraform-state"
  }
}

# Outputs
output "state_bucket_name" {
  value       = google_storage_bucket.terraform_state.name
  description = "The name of the GCS bucket for Terraform state"
}

output "state_bucket_url" {
  value       = google_storage_bucket.terraform_state.url
  description = "The URL of the GCS bucket for Terraform state"
}
