locals {
  nodes = fileexists(var.nodes_config) && length(trimspace(regex("[^#]", file(var.nodes_config)))) > 0 ? yamldecode(file(var.nodes_config)) : {}
}

resource "azurerm_resource_group" "aks" {
  name     = "aks-${var.env}-rg"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.env}"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix         = "aks-${var.env}"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

# Create node pools based on the YAML configuration
resource "azurerm_kubernetes_cluster_node_pool" "node_pools" {
  for_each = local.nodes

  name                  = each.key
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size              = each.value.machine_type
  node_count           = try(each.value.node_count, 1)
  zones                = try(each.value.zones, null)
  
  # Optional configurations
  enable_auto_scaling  = try(each.value.enable_auto_scaling, false)
  min_count           = try(each.value.min_count, null)
  max_count           = try(each.value.max_count, null)
  
  node_labels = try(each.value.labels, {})
  node_taints = try(each.value.taints, [])

  tags = try(each.value.tags, {})
} 