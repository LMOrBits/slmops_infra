output "repository_id" {
  description = "The ID of the artifact registry repository"
  value       = google_artifact_registry_repository.ml_images.repository_id
} 