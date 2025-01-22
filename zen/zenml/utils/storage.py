from google.cloud import storage
from pynessie import init
import os

class StorageConfig:
    def __init__(self, bucket_name: str, project_id: str):
        self.bucket_name = bucket_name
        self.project_id = project_id
        self.client = storage.Client(project=project_id)
        self.bucket = self.client.bucket(bucket_name)
        
    def upload_to_gcs(self, source_path: str, destination_blob_name: str):
        """Upload a file to GCS bucket."""
        blob = self.bucket.blob(destination_blob_name)
        blob.upload_from_filename(source_path)
        return f"gs://{self.bucket_name}/{destination_blob_name}"

class NessieConfig:
    def __init__(self, nessie_uri: str):
        self.nessie = init(nessie_uri)
        
    def register_dataset(self, name: str, location: str, version: str = "main"):
        """Register a dataset in Nessie catalog."""
        ref = self.nessie.get_reference(version)
        ref.commit(f"Adding dataset {name}", 
                  operations=[("PUT", f"datasets.{name}", {
                      "location": location,
                      "format": "parquet",
                      "type": "dataset"
                  })]) 