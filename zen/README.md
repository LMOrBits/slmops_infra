# prerequsition

```bash
export ZENML_CONFIG_PATH=./.zenml
```

# port forwarding

```bash
### for local env
make zenml-port-forward
```

# login

```bash
# uv run zenml login http://zenml-server.zenml.svc.cluster.local:8080
uv run zenml login https://zenml.lmorbits.com
```

# create-gcs-connector

```bash
make create-gcs-connector
```

# create-gcs-artifact-store

```bash
make create-gcs-artifact-store
```

# create-k3d-orchestrator

```bash
make create-k3d-orchestrator
```

# create-local-image-builder

```bash
make create-local-image-builder
```

# create-gcs-container-registry

```bash
make create-gcs-container-registry
```

# create experiment tracking

```bash
make add-mlflow-tracking
```

# k3d-enable-gcs-container-registry

```bash
make k3d-enable-gcs-container-registry
```

# setup-stack-gcs-mlflow-kubernetes

```bash
make setup-stack-gcs-mlflow-kubernetes
```

# use-stack

```bash
uv run zenml stack use test-stack
```

# skypilot k8s

```bash
make add-sky-kube
```

# skypilot gcs

```bash
make add-sky-gcs
```

# setup-stack-gcs-mlflow-sky-kube

```bash
make setup-stack-gcs-mlflow-sky-kube
```

# setup-stack-gcs-mlflow-gcs

```bash
make setup-stack-gcs-mlflow-sky-gcs
```
