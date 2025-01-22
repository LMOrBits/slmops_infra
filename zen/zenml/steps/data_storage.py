from typing_extensions import Annotated
import dask.dataframe as dd
from zenml import step
from zenml.logger import get_logger
from ..utils.storage import StorageConfig, NessieConfig
from ..pipelines.config import DataIngestionConfig

logger = get_logger(__name__)

@step
def store_data(
    data: Annotated[dd.DataFrame, "raw_data"],
    config: DataIngestionConfig
) -> None:
    """Store data in GCS and register in Nessie catalog."""
    
    # Initialize storage configs from configuration
    storage = StorageConfig(
        config.storage.gcs.bucket_name,
        config.storage.gcs.project_id
    )
    nessie = NessieConfig(config.storage.nessie.uri)
    
    # Save data to temporary parquet files
    temp_path = f"{config.dataset.cache_dir}/data.parquet"
    data.to_parquet(temp_path)
    
    # Upload to GCS
    gcs_path = storage.upload_to_gcs(
        temp_path,
        f"{config.storage.gcs.base_path}/{config.dataset.name}/data.parquet"
    )
    
    # Register in Nessie catalog
    nessie.register_dataset(
        config.dataset.name,
        gcs_path,
        version=config.storage.nessie.default_branch
    )
    
    logger.info(f"Data stored in GCS and registered in Nessie: {gcs_path}") 