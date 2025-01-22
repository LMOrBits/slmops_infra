.PHONY: integrate-kubernetes
integrate-kubernetes:
	uv run zenml integration install --uv kubernetes


all: \
	create-gcs-connector ; \
	create-gcs-artifact-store ; \
	create-gcs-container-registry ; \
	create-k3d-orchestrator ; \
	create-local-image-builder ; \
	add-mlflow-tracking ; \
	add-data-validation ; \
	setup-stack-gcs-mlflow-kubernetes

stack-default:
	uv run stack set default

create-gcs-connector:
	uv run zenml integration install gcp -y --uv
	uv run zenml service-connector register google_cloud_connector --type gcp \
		--auth-method service-account \
		--project_id=slmops-dev \
		--generate_temporary_tokens=False

create-gcs-artifact-store:
	uv run zenml artifact-store register gcs_store -f gcp \
		--path=gs://slmops-dev-ml-artifacts \
		--authentication_secret=gcp_secret
	uv run zenml artifact-store connect gcs_store --connector google_cloud_connector

create-gcs-container-registry:
	uv run zenml container-registry register gcs-container-registry \
		--flavor=gcp \
		--uri=europe-north1-docker.pkg.dev/slmops-dev/images-dev
	uv run zenml container-registry connect gcs-container-registry --connector google_cloud_connector


create-k3d-orchestrator:
	uv run zenml orchestrator register k3d-orchestrator \
		--flavor=kubernetes \
		--kubernetes_context=k3d-slmops-cluster
	kubectl create namespace zenml

create-k8s-orchestrator:
	uv run zenml orchestrator register k8s\
		--flavor=kubernetes \
		--kubernetes_context=$$(kubectl config current-context)


create-local-image-builder:
	uv run zenml image-builder register docker-local --flavor=local
	kubectl create secret generic registry-secret \
		--from-file=.dockerconfigjson=$$HOME/.docker/config.json \
		--type=kubernetes.io/dockerconfigjson

add-mlflow-tracking-local:
	uv run zenml experiment-tracker register mlflow_tracker --flavor=mlflow \
		--tracking_username=admin --tracking_password=slmops \
		--tracking_uri=http://mlflow-server-tracking.default.svc.cluster.local:5000
	uv run zenml model-registry register -f mlflow gcs-mlflow

add-mlflow-tracking:
	uv run zenml experiment-tracker register mlflow_tracker --flavor=mlflow \
		--tracking_username=slmops --tracking_password="j6rXZAkyS}MOeYha" \
		--tracking_uri=https://mlflow.lmorbits.com/
	uv run zenml model-registry register -f mlflow gcs-mlflow

add-data-validation:
	uv run zenml integration install deepchecks -y --uv
	uv run zenml data-validator register deepchecks_data_validator --flavor=deepchecks

setup-stack-gcs-mlflow-kubernetes:
# uv run zenml stack register gcs-mlflow-kubernetes-stack
		uv run zenml stack register test-stack \
		--artifact-store gcs_store \
		--orchestrator k3d-orchestrator \
		--container_registry gcs-container-registry \
		--image_builder docker-local \
		--model_registry gcs-mlflow \
		--experiment_tracker mlflow_tracker \
		--set
		uv run zenml stack set test-stack


######

add-starter-deps:
	uv run zenml integration install sklearn pandas -y --uv

k3d-enable-gcs-container-registry:
	kubectl create secret -n zenml docker-registry artifact-registry-secret \
		--docker-server=https://europe-north1-docker.pkg.dev \
    --docker-username=oauth2accesstoken \
    --docker-password="$$(gcloud auth print-access-token)" \
    --docker-email=super-admin-dev@slmops-dev.iam.gserviceaccount.com
	kubectl apply -f zenml_starter/access.yaml
	kubectl patch serviceaccount default -n zenml \
  	-p '{"imagePullSecrets": [{"name": "artifact-registry-secret"}]}'
	kubectl patch serviceaccount zenml-service-account -n zenml \
  	-p '{"imagePullSecrets": [{"name": "artifact-registry-secret"}]}'
	kubectl patch serviceaccount default  \
  	-p '{"imagePullSecrets": [{"name": "artifact-registry-secret"}]}'


k8s-enable-gcs-container-registry:
	kubectl create secret -n zenml docker-registry artifact-registry-secret \
		--docker-server=https://europe-north1-docker.pkg.dev \
    --docker-username=oauth2accesstoken \
    --docker-password="$$(gcloud auth print-access-token)" \
    --docker-email=super-admin-dev@slmops-dev.iam.gserviceaccount.com
	kubectl apply -f zenml_starter/access.yaml
	kubectl patch serviceaccount default -n zenml \
  	-p '{"imagePullSecrets": [{"name": "artifact-registry-secret"}]}'
	kubectl patch serviceaccount zenml-service-account -n zenml \
  	-p '{"imagePullSecrets": [{"name": "artifact-registry-secret"}]}'
	kubectl patch serviceaccount default  \
  	-p '{"imagePullSecrets": [{"name": "artifact-registry-secret"}]}'



add-sky-kube:
	uv run zenml zenml integration install skypilot_kubernete  -y --uv
	uv run zenml orchestrator register sky-kube --flavor sky_kubernetes

add-sky-gcs:
	uv add "zenml[connectors-gcp]"
	uv run zenml integration install gcp skypilot_gcp --uv -y
	uv run zenml orchestrator register sky-gcs --flavor vm_gcp
	uv run zenml orchestrator connect sky-gcs --connector google_cloud_connector

setup-stack-gcs-mlflow-sky-kube:
# uv run zenml stack register gcs-mlflow-kubernetes-stack
		uv run zenml stack register stack-sky-kube \
		--artifact-store gcs_store \
		--orchestrator sky-kube \
		--container_registry gcs-container-registry \
		--image_builder docker-local \
		--model_registry gcs-mlflow \
		--experiment_tracker mlflow_tracker \
		--set
		uv run zenml stack set stack-sky-kube

setup-stack-gcs-mlflow-sky-gcs:
# uv run zenml stack register gcs-mlflow-kubernetes-stack
		uv run zenml stack register stack-sky-gcs \
		--artifact-store gcs_store \
		--orchestrator sky-gcs \
		--container_registry gcs-container-registry \
		--image_builder docker-local \
		--model_registry gcs-mlflow \
		--experiment_tracker mlflow_tracker \
		--set
		uv run zenml stack set stack-sky-gcs

setup-stack-gcs-mlflow-k8s-gcs:
# uv run zenml stack register gcs-mlflow-kubernetes-stack
		uv run zenml stack register stack-k8s-gcs \
		--artifact-store gcs_store \
		--orchestrator k8s\
		--container_registry gcs-container-registry \
		--image_builder docker-local \
		--model_registry gcs-mlflow \
		--experiment_tracker mlflow_tracker \
		--set
		uv run zenml stack set stack-k8s-gcs


# create-image-builder:
# 	uv run zenml integration install kaniko -y --uv
# add-image-builder:
# 	kubectl create namespace zenml-kaniko
# 	uv run zenml image-builder register kaniko-builder \
# 	--flavor=kaniko \
# 	--kubernetes_context=k3d-slmops-cluster \
# 	--namespace=zenml-kaniko


