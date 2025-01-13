variable "subnet_id" {
  description = "ID of the subnet to place the instances in"
  type        = string
}

variable "instances_config" {
  description = "Path to the YAML file containing instance configurations"
  type        = string
}

variable "project_id" {
  description = "The ID of the project"
  type        = string
}

variable "region" {
  description = "The default GCP region"
  type        = string
  default     = "europe-north1"
}