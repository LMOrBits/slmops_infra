.PHONY: cluster-create cluster-delete cluster-start cluster-stop cluster-status install-ingress check-ingress debug-ingress

# Create k3d cluster using the config file
cluster-create:
	k3d cluster create --config k3d-lmops.yaml
	$(MAKE) install-ingress
	$(MAKE) install-zenml

# Delete the k3d cluster
cluster-delete:
	k3d cluster delete slmops-cluster

# Start the cluster if it's stopped
cluster-start:
	k3d cluster start slmops-cluster

# Stop the cluster
cluster-stop:
	k3d cluster stop slmops-cluster


# Install ingress-nginx controller
install-ingress:
	helm repo add nginx-stable https://helm.nginx.com/stable || true
	helm repo update
	helm install nginx-ingress nginx-stable/nginx-ingress \
    --namespace ingress-nginx --create-namespace \
    --set rbac.create=true \
    --set controller.service.type=LoadBalancer \
    --set controller.service.loadBalancerIP=172.18.0.240 

# --= zenml =--
# Install or upgrade ZenML server
install-zenml:
	helm upgrade --install zenml-server ./zenml --values zenml.yml


# --= status =--

# Check ingress status
check-ingress:
	@echo "\nIngress Controller Status:"
	kubectl get pods -n ingress-nginx
	@echo "\nIngress Services:"
	kubectl get svc -n ingress-nginx

# Check ZenML status
check-zenml:
	@echo "\nZenML Pods:"
	kubectl get pods | grep zenml
	@echo "\nZenML Services:"
	kubectl get svc | grep zenml
	@echo "\nZenML Ingress:"
	kubectl get ingress | grep zenml

# Debug ingress
debug-ingress:
	@echo "\nIngress Resources:"
	kubectl get ingress -A
	@echo "\nIngress Controller Logs:"
	kubectl logs -n ingress-nginx -l app.kubernetes.io/name=ingress-nginx
	@echo "\nIngress Controller Events:"
	kubectl get events -n ingress-nginx

# Check cluster status
cluster-status:
	k3d cluster list
	@echo "\nKubernetes Nodes:"
	kubectl get nodes
	@echo "\nKubernetes Pods:"
	kubectl get pods -A