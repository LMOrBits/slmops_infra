import coiled
import dask.dataframe as dd
from datasets import load_dataset
from typing_extensions import Annotated
from zenml import step
from zenml.logger import get_logger
from ..pipelines.config import DataIngestionConfig

logger = get_logger(__name__)

@step
def ingest_data(
    dataset_name: str,
    cluster_name: str = "data-ingestion-cluster",
    n_workers: int = 3,
    worker_cpu: int = 1,
    worker_memory: int = 1024,
    batch_size: int = 1000,  # Number of rows per batch
    scheduler_options: dict = {"dashboard_address": ":8787"}
) -> Annotated[dd.DataFrame, "raw_data"]:
    """Ingest data from HuggingFace using Dask and Coiled, processing in batches."""
    
    # Create Coiled cluster using config
    cluster = coiled.Cluster(
        name=cluster_name,
        n_workers=n_workers,
        worker_cpu=worker_cpu,
        worker_memory=worker_memory,
        scheduler_options=scheduler_options
    )
    
    # Create Dask client to connect to the cluster
    from dask.distributed import Client
    client = Client(cluster)
    
    try:
        # Load dataset from HuggingFace
        dataset = load_dataset(dataset_name, split="train")

        # Convert dataset to batches
        def process_batch(batch):
            return dd.from_pandas(batch.to_pandas(), npartitions=1)

        logger.info(f"Processing dataset in batches of {batch_size} rows.")
        all_batches = []
        
        for i in range(0, len(dataset), batch_size):
            batch = dataset.select(range(i, min(i + batch_size, len(dataset))))
            dask_batch = process_batch(batch)
            all_batches.append(dask_batch)
        
        # Combine all batches into a single Dask DataFrame
        ddf = dd.concat(all_batches)
        
        # Trigger computation to verify data ingestion
        row_count = ddf.shape[0].compute()
        logger.info(f"Processed dataset with total rows: {row_count}")
        
        return ddf
        
    finally:
        # Clean up resources
        client.close()
        cluster.close()