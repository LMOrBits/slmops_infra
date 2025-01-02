output "service_account_email" {
  description = "The email address of the service account"
  value       = google_service_account.ml_pipeline_sa.email
}

output "service_account_id" {
  description = "The ID of the service account"
  value       = google_service_account.ml_pipeline_sa.id
} 