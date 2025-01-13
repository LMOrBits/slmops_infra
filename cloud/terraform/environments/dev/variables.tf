variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The default GCP region"
  type        = string
  default     = "europe-north1"
}

# Module enablement variables
variable "enable_artifact_registry" {
  description = "Enable Artifact Registry module"
  type        = bool
  default     = false
}

variable "enable_vertex_ai" {
  description = "Enable Vertex AI module"
  type        = bool
  default     = false
}

variable "enable_cloud_build" {
  description = "Enable Cloud Build module"
  type        = bool
  default     = false
}


variable "enable_compute_build" {
  description = "activates the compute engines"
  type        = bool
  default     = false
}


variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR range for the subnet"
  type        = string
}

variable "instances_config" {
  description = "Path to the YAML file containing instance configurations"
  type        = string
}
