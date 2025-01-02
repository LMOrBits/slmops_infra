variable "project_id" {
  description = "The ID of the project"
  type        = string
}

variable "ml_artifacts_bucket_name" {
  description = "Name of the ML artifacts bucket"
  type        = string
}

variable "data_instructed_bucket_name" {
  description = "Name of the instructed data bucket"
  type        = string
}

variable "data_uninstructed_bucket_name" {
  description = "Name of the uninstructed data bucket"
  type        = string
} 
