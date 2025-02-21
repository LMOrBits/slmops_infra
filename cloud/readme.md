# Infrastructure and Deployment Documentation

This repository contains the infrastructure as code (IaC) and deployment configurations for a comprehensive MLOps platform. The setup includes various components such as Kubernetes clusters, MLflow, ZenML, LakeFS, and other essential services for machine learning operations.

## Repository Structure

```
.
├── terraform/
│   ├── modules/              # Reusable Terraform modules
│   │   ├── artifact-registry/
│   │   ├── cloud-build/
│   │   ├── service-account/
│   │   ├── storage/
│   │   ├── vertex-ai/
│   │   ├── compute/
│   │   ├── vpc/
│   │   ├── aks/
│   │   ├── iam/
│   │   └── civo-k8s/
│   ├── environments/         # Environment-specific configurations
│   │   ├── dev/
│   │   ├── staging/
│   │   └── prod/
│   └── init/                # Terraform initialization configs
├── manifests/               # Kubernetes manifests (helm charts)
├── ...
```

## Prerequisites

- Helm package manager
- kubectl CLI tool
- Google Cloud SDK (for GCP resources)
- Terraform

## Infrastructure Components

### Core Infrastructure (Terraform)
- VPC and Networking
- IAM and Service Accounts
- Storage (GCS)
- Artifact Registry
- Compute Resources
- Kubernetes Clusters (AKS/Civo-K8s support)

### Platform Services
1. **Ingress Controller**
   - NGINX Ingress Controller for external access
   - Configured with extended timeouts and large body size support

2. **ZenML**
   - MLOps framework deployment
   - Configured with artifact store integration
   - Docker registry authentication setup

3. **LakeFS**
   - Data versioning and management
   - Integrated with GCS backend
   - Requires GCS credentials configuration

4. **MLflow**
   - Experiment tracking and model registry
   - Configured with artifact storage
   - Accessible via port forwarding (5000)

5. **KubeRay** (optional)
   - Ray cluster deployment on Kubernetes
   - Supports distributed ML workloads
   - Includes operator, cluster, and job configurations

## Deployment Steps

1. **Initialize Infrastructure**
   ```bash
   # Navigate to terraform directory and initialize
   cd terraform
   terraform init
   terraform plan
   terraform apply
   ```

2. **Deploy Core Services**
   ```bash
   # Install Ingress Controller
   make install-ingress

   # Deploy ZenML
   make install-zenml

   # Configure Docker Registry Authentication
   make gcloud-docker-auth
   make gcloud-docker-auth-zen

   # Setup LakeFS
   make add-gcs-secret-lakefs
   make install-lakefs

   # Deploy MLflow
   make install-mlflow
   ```

3. **Additional Services (Optional)**
   ```bash
   # Install KubeRay
   make install-kuberay
   make install-kuberay-cluster
   make install-kuberay-job
   ```

## Available Make Commands

### Cluster Management with k3d
- `cluster-create`: Create a new cluster
- `cluster-delete`: Delete the cluster
- `cluster-start`: Start the cluster
- `cluster-stop`: Stop the cluster
- `cluster-status`: Check cluster status
- `cluster-test`: Test cluster connectivity

### Service Management
- `install-ingress`: Deploy NGINX ingress controller
- `install-zenml`: Deploy ZenML server
- `install-mlflow`: Deploy MLflow server
- `install-lakefs`: Deploy LakeFS
- `install-kuberay`: Deploy KubeRay operator and components

### Monitoring and Debugging
- `check-ingress`: Verify ingress status
- `check-zenml`: Check ZenML deployment status
- `check-mlflow`: Verify MLflow deployment
- `debug-ingress`: Debug ingress issues
- `debug`: Launch a debug pod in the cluster

### Port Forwarding
- `zenml-port-forward`: Forward ZenML server port (8080)
- `mlflow-port-forward`: Forward MLflow server port (5000)
- `port-forward-kuberay`: Forward KubeRay ports

## Troubleshooting

1. **Ingress Issues**
   - Use `make check-ingress` to verify ingress controller status
   - Use `make debug-ingress` for detailed ingress debugging

2. **Service Status**
   - Use `make cluster-status` for overall cluster health
   - Individual service checks available via respective commands

3. **Authentication Issues**
   - Verify GCP credentials are properly configured
   - Ensure docker registry secrets are created in correct namespaces

## Security Considerations

- Sensitive credentials are managed through Kubernetes secrets
- Service account keys should be properly secured
- Access controls are managed through IAM configurations
- Docker registry authentication is namespace-specific

## Notes

- Ensure proper GCP permissions are configured before deployment
- Some services require specific storage configurations
- Monitor resource usage in development environment
- Regular backup of critical data is recommended

## Terraform Setup and Deployment

### 1. Backend Initialization
First, you need to set up the Terraform backend in Google Cloud Storage:

```bash
# Navigate to the init directory
cd terraform/init

# Initialize and apply the backend configuration
terraform init
terraform plan
terraform apply

# This will create:
# - GCS bucket for Terraform state
# - Service account for Terraform
# - Required IAM permissions
```

### 2. Environment Configuration
After setting up the backend, you can configure your desired environment:

```bash
# Navigate to your target environment (e.g., dev)
cd ../environments/dev

# Optional: Generate SSH keys if using K3s functionality
make generate-keys  # Only needed if deploying K3s clusters

# Initialize Terraform with the backend
make init

# Review and apply the configuration
make plan
make apply
```

### 3. Environment Structure
Each environment directory (dev/staging/prod) contains:
```
environments/
└── dev/
    ├── main.tf          # Main Terraform configuration
    ├── variables.tf     # Environment-specific variables
    ├── terraform.tfvars # Variable values
    ├── outputs.tf       # Output definitions
    └── backend.tf       # Backend configuration
```

### 4. Available Terraform Commands
```bash
# Basic Commands
make init              # Initialize Terraform
make plan             # Show planned changes
make apply            # Apply changes with auto-approve
make destroy          # Destroy infrastructure with auto-approve
make validate         # Format and validate Terraform configuration
make clean            # Clean Terraform files and state

# State Management
make show             # Show current state
make refresh          # Refresh state
make outputs          # Show all outputs

# Workspace Management
make workspace env=<name>      # Create new workspace
make select-workspace env=<name> # Select workspace
make list-workspaces          # List all workspaces

# Infrastructure Access for k3s setup
make generate-keys            # Generate SSH keys for instances
make ssh instance=<name>      # SSH into specific instance
make list-instances          # List available instances

# Cloud Configuration
make configure-gcloud        # Configure gcloud defaults
make civo-contex-add        # Add Civo Kubernetes context

# K3s Cluster Management
make k3s-status             # Check K3s cluster nodes
make k3s-token              # Get K3s node token
```

### 5. Important Notes
- The backend configuration in `init/` only needs to be done once per project
- Each environment maintains its own state in the GCS bucket
- Service account keys are automatically generated in the `keys/` directory
- Always review the plan before applying changes
- Use workspaces if working with multiple configurations in the same environment
- SSH keys are required for K3s cluster access and stored in the `keys/` directory
- The default region is set to `europe-north1` and can be configured in `terraform.tfvars`
