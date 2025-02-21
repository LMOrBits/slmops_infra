.PHONY: cluster-create cluster-delete cluster-start cluster-stop cluster-status install-ingress check-ingress debug-ingress

cluster-create:
	- echo "to do"

cluster-test:
	kubectl get nodes

cluster-delete:
	- echo "to do"

cluster-start:
	- echo "to do"

cluster-stop:
	- echo "to do"

add-gcs-secret-lakefs:
	kubectl create secret generic gcs-credentials --from-file=credentials.json=../cloud/terraform/environments/dev/keys/super-admin-key.json

# --= ingress =--
# Install ingress-nginx controller
install-ingress:
	helm install nginx-ingress ingress-nginx/ingress-nginx \
  --set controller.service.type=LoadBalancer \
  --set controller.config.proxy-body-size=20g \
  --set controller.config.proxy-read-timeout=600 \
  --set controller.config.proxy-send-timeout=600 \
  --set controller.config.proxy-connect-timeout=600

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

gcloud-docker-auth-zen:
	kubectl create secret docker-registry artifact-registry-secret \
		--docker-server=https://europe-north1-docker.pkg.dev \
    --docker-username=_json_key \
    --docker-password="$$(cat ./terraform/environments/dev/keys/super-admin-key.json)" \
    --docker-email=super-admin-dev@slmops-dev.iam.gserviceaccount.com \
		--namespace zenml

gcloud-docker-auth:
	kubectl create secret docker-registry artifact-registry-secret \
		--docker-server=https://europe-north1-docker.pkg.dev \
    --docker-username=_json_key \
    --docker-password="$$(cat ./terraform/environments/dev/keys/super-admin-key.json)" \
    --docker-email=super-admin-dev@slmops-dev.iam.gserviceaccount.com

# --= lakefs =--
install-lakefs:
	helm repo add lakefs https://charts.lakefs.io
	helm upgrade --install lakefs lakefs/lakefs --values ./manifests/lakefs.yaml

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

## --= optik =--
install-optik:
	helm repo add opik https://comet-ml.github.io/opik/
	helm repo update

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
