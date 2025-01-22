from zenml.materializers.base_materializer import BaseMaterializer
from typing import Any, Type
import dask.dataframe as dd
import os

class DaskDataFrameMaterializer(BaseMaterializer):
    """Materializer for Dask DataFrames."""
    
    ASSOCIATED_TYPES = (dd.DataFrame,)
    
    def load(self, data_type: Type[Any]) -> dd.DataFrame:
        """Load Dask DataFrame from parquet files."""
        path = os.path.join(self.uri, "data.parquet")
        return dd.read_parquet(path)
    
    def save(self, df: dd.DataFrame) -> None:
        """Save Dask DataFrame to parquet files."""
        path = os.path.join(self.uri, "data.parquet")
        df.to_parquet(path) 