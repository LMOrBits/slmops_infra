# Create super admin service account
resource "google_service_account" "super_admin" {
  account_id   = "super-admin-${var.env}"
  display_name = "Super Admin Service Account"
  project      = var.project_id
}

# Grant project-wide admin roles
resource "google_project_iam_member" "super_admin_roles" {
  for_each = toset([
    "roles/editor",                  # Broad edit access across project
    "roles/compute.admin",           # Full control of compute resources
    "roles/storage.admin",           # Full control of storage
    "roles/iam.serviceAccountAdmin", # Can manage service accounts
    "roles/cloudfunctions.admin",    # Full control of Cloud Functions
    "roles/cloudscheduler.admin",    # Full control of Cloud Scheduler
    "roles/logging.admin",           # Full control of logging
    "roles/monitoring.admin",        # Full control of monitoring
    "roles/artifactregistry.admin",  # Full control of artifact registry
    "roles/storage.objectViewer",    # View access to storage objects
    "roles/storage.objectCreator"    # Create access to storage objects
  ])

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.super_admin.email}"
}

# Generate key for super admin
resource "google_service_account_key" "super_admin_key" {
  service_account_id = google_service_account.super_admin.name
}
# Create service accounts
resource "google_service_account" "storage_admin" {
  account_id   = "storage-admin-sa"
  display_name = "Storage Admin Service Account"
  project      = var.project_id
}

# Add project-level storage permissions for storage-admin
resource "google_project_iam_member" "storage_admin_permissions" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.storage_admin.email}"
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
