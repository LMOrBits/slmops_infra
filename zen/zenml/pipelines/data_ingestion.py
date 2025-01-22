from zenml import pipeline
from zenml.config import DockerSettings
from .config import DataIngestionConfig
from ..steps import ingest_data, store_data

@pipeline(
    settings={
        "docker": DockerSettings(
            requirements=["dask[complete]", "coiled", "dlt", "python-nessie", 
                        "google-cloud-storage", "datasets"]
        )
    }
)
def data_ingestion_pipeline(config: DataIngestionConfig):
    """Pipeline to ingest data from HuggingFace and store in GCS."""
    data = ingest_data(config=config)
    store_data(data=data, config=config) 