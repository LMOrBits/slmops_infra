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
