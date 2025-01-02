output "ml_artifacts_bucket" {
  description = "ML artifacts bucket details"
  value = {
    name     = google_storage_bucket.ml_artifacts.name
    url      = "gs://${google_storage_bucket.ml_artifacts.name}"
    location = google_storage_bucket.ml_artifacts.location
    project  = google_storage_bucket.ml_artifacts.project
  }
}

output "data_instructed_bucket" {
  description = "Instructed data bucket details"
  value = {
    name     = google_storage_bucket.data_instructed.name
    url      = "gs://${google_storage_bucket.data_instructed.name}"
    location = google_storage_bucket.data_instructed.location
    project  = google_storage_bucket.data_instructed.project
  }
}

output "data_uninstructed_bucket" {
  description = "Uninstructed data bucket details"
  value = {
    name     = google_storage_bucket.data_uninstructed.name
    url      = "gs://${google_storage_bucket.data_uninstructed.name}"
    location = google_storage_bucket.data_uninstructed.location
    project  = google_storage_bucket.data_uninstructed.project
  }
}
