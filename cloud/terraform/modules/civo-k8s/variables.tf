variable "master_config" {
  description = "Configuration for the master node pool"
  type = object({
    machine_type = string
    node_count   = number
    zone         = string
  })
  default = {
    machine_type = "g4p.kube.small"
    node_count   = 3
    zone         = "lon1"
  }
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
  default     = "slmops"
}

variable "cluster_config" {
  description = "Path to the YAML file containing cluster configuration"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
} 

variable "enable_civo_cluster" {
  description = "Enable Civo cluster"
  type        = bool
  default     = false
}