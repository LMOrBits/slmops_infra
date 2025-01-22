.PHONY: init plan apply destroy clean generate-keys

# Default region and project from terraform.tfvars
REGION := europe-north1
PROJECT := slmops-dev

# List of instances
INSTANCES := web-server-1 db-server-1

# Default target
all: init plan

# Initialize Terraform
init:
	terraform init

# Show planned changes
plan:
	terraform plan

# Apply changes
apply:
	terraform apply -auto-approve

# Destroy infrastructure
destroy:
	terraform destroy -auto-approve

# Clean Terraform files
clean:
	rm -rf .terraform
	rm -f .terraform.lock.hcl
	rm -f terraform.tfstate*

# Generate SSH keys for instances
generate-keys:
	mkdir -p keys
	ssh-keygen -t rsa -f keys/id_rsa -C "debian" -N ""
	chmod 600 keys/id_rsa
	chmod 644 keys/*.pub

# Configure gcloud defaults
configure-gcloud:
	gcloud config set project $(PROJECT)
	gcloud config set compute/region $(REGION)

# Validate terraform files
validate:
	terraform fmt -recursive
	terraform validate

# Show current state
show:
	terraform show

# Refresh state
refresh:
	terraform refresh

# Output specific values
outputs:
	terraform output

# Create workspace
workspace:
	terraform workspace new $(env)

# Select workspace
select-workspace:
	terraform workspace select $(env)

# List workspaces
list-workspaces:
	terraform workspace list

# SSH into a specific instance (usage: make ssh instance=web-server-1)
ssh:
	@if [ -z "$(instance)" ]; then \
		echo "Please specify an instance name: make ssh instance=<instance-name>"; \
		echo "Available instances:"; \
		echo "$(INSTANCES)" | tr ' ' '\n' | sed 's/^/  - /'; \
		exit 1; \
	fi
	ssh -F keys/ssh_config $(instance)



# k3s-status
k3s-status:
	ssh -F keys/ssh_config master "sudo kubectl get nodes"

# k3s-token
k3s-token:
	ssh -F keys/ssh_config master "sudo cat /var/lib/rancher/k3s/server/node-token"

civo-contex-add:
	civo kubernetes config slmops --save --switch 


# List available instances
list-instances:
	@echo "Available instances:"
	@echo "$(INSTANCES)" | tr ' ' '\n' | sed 's/^/  - /'

# Help target
help:
	@echo "Available targets:"
	@echo "  init              - Initialize Terraform"
	@echo "  plan              - Show planned changes"
	@echo "  apply             - Apply changes"
	@echo "  destroy           - Destroy infrastructure"
	@echo "  clean             - Clean Terraform files"
	@echo "  generate-keys     - Generate SSH keys for instances"
	@echo "  configure-gcloud  - Configure gcloud defaults"
	@echo "  validate          - Validate Terraform files"
	@echo "  show              - Show current state"
	@echo "  refresh           - Refresh state"
	@echo "  outputs           - Show outputs"
	@echo "  workspace         - Create new workspace (use with env=name)"
	@echo "  select-workspace  - Select workspace (use with env=name)"
	@echo "  list-workspaces   - List all workspaces"
	@echo "  ssh               - SSH into an instance (use with instance=name)"
	@echo "  list-instances    - List available instances"
