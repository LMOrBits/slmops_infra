
locals {
  project_id = var.project_id
  region     = var.region
  env        = "dev"
}

module "service_account" {
  source     = "../../modules/service-account"
  project_id = local.project_id
  env        = local.env
}

module "storage" {
  source     = "../../modules/storage"
  project_id = local.project_id
  env        = local.env
  location   = local.region
}

module "artifact_registry" {
  count      = var.enable_artifact_registry ? 1 : 0
  source     = "../../modules/artifact-registry"
  project_id = local.project_id
  env        = local.env
  location   = local.region
}

module "vertex_ai" {
  count      = var.enable_vertex_ai ? 1 : 0
  source     = "../../modules/vertex-ai"
  project_id = local.project_id
  env        = local.env
  region     = local.region
  depends_on = [module.service_account]
}

module "cloud_build" {
  count      = var.enable_cloud_build ? 1 : 0
  source     = "../../modules/cloud-build"
  project_id = local.project_id
  env        = local.env
  region     = local.region
}


module "iam" {
  source = "../../modules/iam"

  project_id                    = var.project_id
  ml_artifacts_bucket_name      = module.storage.ml_artifacts_bucket.name
  data_instructed_bucket_name   = module.storage.data_instructed_bucket.name
  data_uninstructed_bucket_name = module.storage.data_uninstructed_bucket.name
  env                           = var.env
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
  region      = var.region
  project_id  = var.project_id
}
module "compute" {
  count = var.enable_compute_build ? 1 : 0
  source = "../../modules/compute"

  subnet_id        = module.vpc.subnet_id
  instances_config = var.instances_config
  project_id       = var.project_id
}
provider "civo" {
  region = "fra1"
}
module "civo_cluster" {
  count = var.enable_civo_cluster ? 1 : 0
  source = "../../modules/civo-k8s"
 providers = {
    civo = civo
  }
  cluster_config = "${path.module}/civo-cluster-config.yaml"
  environment    = "dev"
}
