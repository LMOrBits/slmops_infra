terraform {
  backend "gcs" {
    bucket = "tf-state-slmops-dev"
    prefix = "environments/dev"
  }
}
