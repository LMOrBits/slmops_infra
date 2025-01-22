from typing import Dict, List, Optional
from pydantic import BaseModel
from zenml.steps import BaseParameters

class DockerSettings(BaseModel):
    """Docker configuration settings."""
    parent_image: Optional[str] = None
    skip_build: bool = False
    requirements: str = "requirements.txt"
    environment: Dict[str, str] = {}

class ModelConfig(BaseModel):
    """Model configuration."""
    name: str
    description: str
    tags: List[str]

class ClusterSettings(BaseModel):
    """Dask cluster settings."""
    name: str
    n_workers: int
    worker_cpu: int
    worker_memory: str
    scheduler_options: Dict[str, str]

class StorageSettings(BaseModel):
    """Storage configuration."""
    gcs_bucket: str
    project_id: str
    base_path: str
    nessie_uri: str
    cache_dir: str = "/tmp/dataset_cache"

class PipelineParameters(BaseModel):
    """Pipeline execution parameters."""
    dataset_name: str
    partition_size: int = 128
    batch_size: int = 32
    num_epochs: int = 1

class StepParameters(BaseModel):
    """Step-specific parameters."""
    subset_size: float = 1.0
    train_size: float = 0.7
    test_size: float = 0.1
    eval_size: float = 0.2
    random_state: int = 42

class DataIngestionConfig(BaseParameters):
    """Complete pipeline configuration."""
    settings: DockerSettings
    model: ModelConfig
    cluster: ClusterSettings
    storage: StorageSettings
    parameters: PipelineParameters
    steps: Dict[str, StepParameters] 