resource "google_service_account" "ml_pipeline_sa" {
  account_id   = "ml-pipeline-sa-${var.env}"
  display_name = "ML Pipeline Service Account ${var.env}"
  project      = var.project_id
}

resource "google_project_iam_member" "ml_pipeline_sa_roles" {
  for_each = toset([
    "roles/aiplatform.user",
    "roles/storage.objectViewer",
    "roles/artifactregistry.reader",
    "roles/cloudbuild.builds.builder"
  ])
  
  project = var.project_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.ml_pipeline_sa.email}"
} 