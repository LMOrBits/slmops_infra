import pandas as pd
import numpy as np
from zenml import pipeline, step
from zenml.config import DockerSettings
from typing import Tuple

@step
def create_random_data() -> Tuple[pd.DataFrame, str]:
    """Generate a random DataFrame with some basic statistics."""
    # Create random data
    np.random.seed(42)
    df = pd.DataFrame({
        'sales': np.random.normal(100, 200, 100),
        'customers': np.random.randint(50, 200, 100),
        'satisfaction': np.random.uniform(3.5, 5.0, 100)
    })

    # Add some basic statistics
    message = f"""
    Dataset Statistics:
    Total Records: {len(df)}
    Average Sales: ${df['sales'].mean():.2f}
    Average Customers: {df['customers'].mean():.0f}
    Average Satisfaction: {df['satisfaction'].mean():.2f}
    """

    return df ,message

@step
def process_data(df: pd.DataFrame) -> pd.DataFrame:
    """Process the DataFrame by adding some derived metrics."""
    df['revenue_per_customer'] = df['sales'] / df['customers']
    df['performance_score'] = df['satisfaction'] * (df['revenue_per_customer'] / 100)
    return df

docker_settings = DockerSettings(
    requirements=[
        "pandas",
        "numpy",
        "zenml"
    ],
    python_package_installer="uv",
    environment={
        "PYTHONUNBUFFERED": "1",
         "ZENML_STORE_URL": "http://zenml-server.zenml.svc.cluster.local"
    }
)

@pipeline(settings={"docker": docker_settings})
def random_data_pipeline():
    """Pipeline that generates and processes random business data."""
    df, message = create_random_data()
    processed_df = process_data(df)
    return processed_df

if __name__ == "__main__":
    # Initialize and run the pipeline
    pipeline_instance = random_data_pipeline()