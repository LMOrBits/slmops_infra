output "kube_config_filename" {
  description = "The path to the kubeconfig file"
  value       = local.kube_config_filename
}

output "cluster_name" {
  description = "The name of the Civo cluster"
  value       = local.cluster_name
}

output "cluster_id" {
  description = "The ID of the Civo cluster"
  value       = civo_kubernetes_cluster.kubefirst.id
}

output "kubeconfig" {
  description = "The kubeconfig content"
  value       = civo_kubernetes_cluster.kubefirst.kubeconfig
  sensitive   = true
}
