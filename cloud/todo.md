```bash
gcloud projects add-iam-policy-binding slmops-dev \
    --member="serviceAccount:storage-admin-sa@slmops-dev.iam.gserviceaccount.com" \
    --role="roles/storage.admin"
```
