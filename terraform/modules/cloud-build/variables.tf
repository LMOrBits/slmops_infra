variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "region" {
  description = "The region for Cloud Build"
  type        = string
} 