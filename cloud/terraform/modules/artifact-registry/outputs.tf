output "artifact_store" {
  description = "Details of the artifact registry repository"
  value = {
    name     = google_artifact_registry_repository.artifact_store.name
    location = google_artifact_registry_repository.artifact_store.location
    project  = google_artifact_registry_repository.artifact_store.project
    # Construct the URL if it's not directly available
    url = "https://${google_artifact_registry_repository.artifact_store.location}-docker.pkg.dev/${google_artifact_registry_repository.artifact_store.project}/${google_artifact_registry_repository.artifact_store.repository_id}"
  }
}
