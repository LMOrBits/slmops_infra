resource "google_artifact_registry_repository" "artifact_store" {
  location      = var.location
  project       = var.project_id
  repository_id = "images-${var.env}"
  description   = "Docker repository for ZenML pipeline images"
  format        = "DOCKER"
}
