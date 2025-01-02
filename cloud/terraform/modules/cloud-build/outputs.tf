output "trigger_id" {
  description = "The ID of the Cloud Build trigger"
  value       = google_cloudbuild_trigger.ml_pipeline_trigger.trigger_id
} 