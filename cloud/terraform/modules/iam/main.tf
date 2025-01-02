# Create service accounts
resource "google_service_account" "storage_admin" {
  account_id   = "storage-admin-sa"
  display_name = "Storage Admin Service Account"
  project      = var.project_id
}

resource "google_service_account" "storage_user" {
  account_id   = "storage-user-sa"
  display_name = "Storage User Service Account"
  project      = var.project_id
}

# Grant admin permissions
resource "google_storage_bucket_iam_member" "admin_ml_artifacts" {
  bucket = var.ml_artifacts_bucket_name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.storage_admin.email}"
}

resource "google_storage_bucket_iam_member" "admin_data_instructed" {
  bucket = var.data_instructed_bucket_name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.storage_admin.email}"
}

resource "google_storage_bucket_iam_member" "admin_data_uninstructed" {
  bucket = var.data_uninstructed_bucket_name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.storage_admin.email}"
}

# Grant viewer/user permissions
resource "google_storage_bucket_iam_member" "user_ml_artifacts" {
  bucket = var.ml_artifacts_bucket_name
  role   = "roles/storage.objectUser"
  member = "serviceAccount:${google_service_account.storage_user.email}"
}

resource "google_storage_bucket_iam_member" "user_data_instructed" {
  bucket = var.data_instructed_bucket_name
  role   = "roles/storage.objectUser"
  member = "serviceAccount:${google_service_account.storage_user.email}"
}

resource "google_storage_bucket_iam_member" "user_data_uninstructed" {
  bucket = var.data_uninstructed_bucket_name
  role   = "roles/storage.objectUser"
  member = "serviceAccount:${google_service_account.storage_user.email}"
}

# Generate service account keys
resource "google_service_account_key" "storage_admin_key" {
  service_account_id = google_service_account.storage_admin.name
}

resource "google_service_account_key" "storage_user_key" {
  service_account_id = google_service_account.storage_user.name
}
