terraform {
  backend "gcs" {
    bucket = "tf-state-slmops-prod"
    prefix = "environments/prod"
  }
} 
