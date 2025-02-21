terraform {
  required_providers {
    civo = {
      source = "civo/civo"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.19.0"
    }
  }
}

locals {
  cluster_config      = yamldecode(file(var.cluster_config))
  kube_config_filename = "./kubeconfig"
  cluster_name        = local.cluster_config.cluster_name
  master_config       = local.cluster_config.environments[var.environment].master_config
}

resource "civo_network" "kubefirst" {
  label = local.cluster_name
}

resource "civo_firewall" "kubefirst" {
  name                 = "firewall-${local.cluster_name}"
  network_id          = civo_network.kubefirst.id
  create_default_rules = true
}

resource "civo_kubernetes_cluster" "kubefirst" {
  name         = local.cluster_name
  network_id   = civo_network.kubefirst.id
  firewall_id  = civo_firewall.kubefirst.id
  cluster_type = "talos"
  pools {
    label      = local.cluster_name
    size       = local.master_config.machine_type
    node_count = tonumber(local.master_config.node_count)
  }
}

resource "local_file" "kubefirst" {
  content  = civo_kubernetes_cluster.kubefirst.kubeconfig
  filename = "${path.module}/kubeconfig"
  depends_on = [
    civo_kubernetes_cluster.kubefirst
  ]
}