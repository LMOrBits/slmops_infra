locals {
  project_id = var.project_id
  region     = var.region
  env        = "prod"
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
  source     = "../../modules/artifact-registry"
  project_id = local.project_id
  env        = local.env
  location   = local.region
}

module "vertex_ai" {
  source     = "../../modules/vertex-ai"
  project_id = local.project_id
  env        = local.env
  region     = local.region
  depends_on = [module.service_account]
}

module "cloud_build" {
  source     = "../../modules/cloud-build"
  project_id = local.project_id
  env        = local.env
  region     = local.region
} 