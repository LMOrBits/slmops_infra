resource "google_cloudbuild_trigger" "ml_pipeline_trigger" {
  name        = "ml-pipeline-trigger-${var.env}"
  description = "Trigger for ML pipeline builds"
  location    = var.region

  github {
    owner = "your-github-org"
    name  = "your-repo-name"
    push {
      branch = var.env == "prod" ? "^main$" : "^develop$"
    }
  }

  filename = "cloudbuild.yaml"
} 