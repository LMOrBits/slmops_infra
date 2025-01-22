output "cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "cluster_id" {
  description = "The ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.id
}

output "kube_config" {
  description = "Kubernetes configuration"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "node_pools" {
  description = "Map of created node pools"
  value = {
    for name, pool in azurerm_kubernetes_cluster_node_pool.node_pools : name => {
      id        = pool.id
      vm_size   = pool.vm_size
      node_count = pool.node_count
    }
  }
} 