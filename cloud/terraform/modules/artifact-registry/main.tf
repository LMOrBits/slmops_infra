resource "google_artifact_registry_repository" "ml_images" {
  location      = var.location
  repository_id = "ml-images-${var.env}"
  description   = "Docker repository for ML pipeline images"
  format        = "DOCKER"
}
