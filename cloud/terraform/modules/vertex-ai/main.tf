resource "google_project_service" "vertex_ai" {
  project = var.project_id
  service = "aiplatform.googleapis.com"

  disable_dependent_services = true
}

resource "google_vertex_ai_metadata_store" "store" {
  provider = google-beta

  name        = "ml-metadata-store-${var.env}"
  description = "Vertex AI Metadata Store for ${var.env} environment"
  region      = var.region
  project     = var.project_id
}
