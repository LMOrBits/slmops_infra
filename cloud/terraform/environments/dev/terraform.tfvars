project_id = "slmops-dev"
region     = "europe-north1"

vpc_name         = "my-vpc"
subnet_name      = "my-subnet"
subnet_cidr      = "10.0.0.0/24"
instances_config = "instances.yaml"
# Module enablement flags
enable_artifact_registry = true
enable_vertex_ai         = false
enable_cloud_build       = false
enable_compute_build     = false

env = "dev"

enable_civo_cluster = true
civo_region = "fra1"
