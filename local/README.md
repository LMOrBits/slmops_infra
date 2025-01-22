# local Development

this is a local development environment for the SLMops project.

## Prerequisites

haiving k3d would be nice.

# be aware of the following:

- always check the pvc and make sure when deleting the pod, the pvc is deleted.

# for k3d

```bash
make cluster-create
```

```bash
make add-gcs-secret
```

```bash
make gcloud-auth
```

```bash
make install-mlflow
```
