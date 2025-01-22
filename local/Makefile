.PHONY: cluster-create cluster-delete cluster-start cluster-stop cluster-status install-ingress check-ingress debug-ingress

# Create k3d cluster using the config file
cluster-create:
	k3d cluster create --config k3d-lmops.yaml
	$(MAKE) install-ingress
	$(MAKE) install-zenml


gpu-cluster:
	helm repo add nvidia https://helm.ngc.nvidia.com/nvidia \
    && helm repo update

	helm install gpu-operator -n gpu-operator --create-namespace \
  nvidia/gpu-operator $$HELM_OPTIONS \
    --set 'toolkit.env[0].name=CONTAINERD_CONFIG' \
    --set 'toolkit.env[0].value=/var/lib/rancher/k3s/agent/etc/containerd/config.toml' \
    --set 'toolkit.env[1].name=CONTAINERD_SOCKET' \
    --set 'toolkit.env[1].value=/run/k3s/containerd/containerd.sock' \
    --set 'toolkit.env[2].name=CONTAINERD_RUNTIME_CLASS' \
    --set 'toolkit.env[2].value=nvidia'


cluster-test:
	k3d cluster create --config k3d-test.yaml

# Delete the k3d cluster
cluster-delete:
	k3d cluster delete slmops-cluster

# Start the cluster if it's stopped
cluster-start:
	k3d cluster start slmops-cluster

# Stop the cluster
cluster-stop:
	k3d cluster stop slmops-cluster

add-gcs-secret:
	kubectl create secret generic gcs-credentials --from-file=credentials.json=../cloud/terraform/environments/dev/keys/super-admin-key.json

# --= ingress =--
# Install ingress-nginx controller
install-ingress:
	helm repo add nginx-stable https://helm.nginx.com/stable || true
	helm repo update
	helm install nginx-ingress nginx-stable/nginx-ingress \
    --namespace ingress-nginx --create-namespace \
    --set rbac.create=true \
    --set controller.service.type=LoadBalancer \
    --set controller.service.loadBalancerIP=172.18.0.240

# --= dremio =--
install-dremio:
	helm install dremio ./manifests/dremio --values ./manifests/dremio.yaml

# --= zenml =--
# Install or upgrade ZenML server
install-zenml:
	helm upgrade --install zenml-server ./manifests/zenml --values ./manifests/zenml.yml --create-namespace --namespace zenml

zenml-port-forward:
	 kubectl port-forward -n zenml svc/zenml-server 8080:8080

# --= project nessie =--
install-nessie:
	helm repo add nessie-helm https://charts.projectnessie.org
	helm repo update
	helm install -n nessie-ns nessie nessie-helm/nessie --create-namespace

# --= mlflow =--
# Install or upgrade MLflow server
install-mlflow:
	helm upgrade --install mlflow-server ./manifests/mlflow --values ./manifests/mlflow.yml
mlflow-port-forward:
	kubectl port-forward svc/mlflow-server-tracking 5000:5000

gcloud-auth:
	kubectl create secret docker-registry artifact-registry-secret \
		--docker-server=https://europe-north1-docker.pkg.dev \
    --docker-username=oauth2accesstoken \
    --docker-password="$$(gcloud auth print-access-token)" \
    --docker-email=super-admin-dev@slmops-dev.iam.gserviceaccount.com


# --= kuberay =--
install-kuberay:
	helm upgrade --install kuberay-operator ./manifests/ray/kuberay-operator --values ./manifests/ray/ray-values.yaml --create-namespace --namespace kuberay-operator

install-kuberay-job:
	kubectl apply -f https://raw.githubusercontent.com/ray-project/kuberay/v1.2.2/ray-operator/config/samples/ray-job.sample.yaml --namespace kuberay-operator

install-kuberay-cluster:
	helm install raycluster kuberay/ray-cluster --version 1.2.2 --set 'image.tag=2.9.0-aarch64' --namespace kuberay-operator

install-kuberay-service:
	kubectl apply -f https://raw.githubusercontent.com/ray-project/kuberay/v1.2.2/ray-operator/config/samples/ray-service.sample.yaml --namespace kuberay-operator

port-forward-kuberay:
	kubectl port-forward svc/raycluster-kuberay-head-svc 10001:10001 8265:8265 --namespace kuberay-operator


uninstall-kuberay-service:
	kubectl delete -f https://raw.githubusercontent.com/ray-project/kuberay/v1.2.2/ray-operator/config/samples/ray-service.sample.yaml --namespace kuberay-operator

uninstall-kuberay-cluster:
	helm uninstall raycluster --namespace kuberay-operator

uninstall-kuberay-job:
	kubectl delete -f https://raw.githubusercontent.com/ray-project/kuberay/v1.2.2/ray-operator/config/samples/ray-job.sample.yaml --namespace kuberay-operator


# --= spark =--
get-token:
	@docker exec -it k3d-test-server-0 cat /var/lib/rancher/k3s/server/node-token

debug:
	kubectl run -it --rm debug-pod --image=busybox --restart=Never --namespace=zenml -- sh || kubectl exec -it debug-pod -n zenml -- sh

delete-debug:
	kubectl delete pod debug-pod -n zenml
# --= status =--
# List all RayJob custom resources in the `default` namespace.
status-kuberay-jobs:
	@echo "Fetching all RayJob statuses..."
	kubectl get rayjob -n kuberay-operator
	@echo "\nFetching all RayCluster statuses..."
	kubectl get raycluster -n kuberay-operator
	@echo "\nFetching all Pods..."
	kubectl get pods -n kuberay-operator
	@echo "\nChecking the status of the RayJob..."
	kubectl get rayjobs.ray.io rayjob-sample -o jsonpath='{.status.jobStatus}' -n kuberay-operator
	@echo "[Expected output]: \"SUCCEEDED\""
	@echo "\nChecking the deployment status of the RayJob..."
	kubectl get rayjobs.ray.io rayjob-sample -o jsonpath='{.status.jobDeploymentStatus}' -n kuberay-operator
	@echo "[Expected output]: \"Complete\""


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

# Check MLflow status
check-mlflow:
	@echo "\nMLflow Pods:"
	kubectl get pods | grep mlflow
	@echo "\nMLflow Services:"
	kubectl get svc | grep mlflow
	@echo "\nMLflow Ingress:"
	kubectl get ingress | grep mlflow

# Check cluster status
cluster-status:
	k3d cluster list
	@echo "\nKubernetes Nodes:"
	kubectl get nodes
	@echo "\nKubernetes Pods:"
	kubectl get pods -A
	@echo "\nMLflow Status:"
	$(MAKE) check-mlflow
	@echo "\nZenML Status:"
	$(MAKE) check-zenml
	@echo "\nIngress Status:"
	$(MAKE) check-ingress
