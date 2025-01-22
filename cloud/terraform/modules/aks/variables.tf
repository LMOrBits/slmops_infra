variable "nodes_config" {
  description = "Path to the YAML file containing node pool configurations"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
} 