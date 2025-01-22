output "storage_admin_key" {
  description = "The service account key for storage admin"
  value       = google_service_account_key.storage_admin_key.private_key
  sensitive   = true
}

output "storage_user_key" {
  description = "The service account key for storage user"
  value       = google_service_account_key.storage_user_key.private_key
  sensitive   = true
}

output "super_admin_key" {
  description = "The service account key for super admin"
  value       = google_service_account_key.super_admin_key.private_key
  sensitive   = true
}

output "super_admin" {
  description = "The super admin key"
  value       = google_service_account_key.super_admin_key.private_key
}

output "storage_admin_email" {
  description = "The email of the storage admin service account"
  value       = google_service_account.storage_admin.email
}

output "storage_user_email" {
  description = "The email of the storage user service account"
  value       = google_service_account.storage_user.email
}

