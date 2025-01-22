module "civo_cluster" {
  source = "../../modules/civo-k8s"
  
  cluster_config = "${path.module}/cluster-config.yaml"
  environment    = "staging"
} 