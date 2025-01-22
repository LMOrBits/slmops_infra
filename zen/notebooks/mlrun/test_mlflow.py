

import mlflow
import os
import mlflow
from configparser import ConfigParser
config = ConfigParser()
config.read('./my_auth_config.ini')
os.environ['MLFLOW_TRACKING_USERNAME'] = config['mlflow']['TRACKING_USERNAME']
os.environ['MLFLOW_TRACKING_PASSWORD'] = config['mlflow']['TRACKING_PASSWORD']

mlflow.set_tracking_uri(config['mlflow']['URL'])

import pandas as pd
import numpy as np

np.random.seed(42)  # for reproducibility
df = pd.DataFrame({
    'sales': np.random.normal(1000, 200, 100),
    'customers': np.random.randint(50, 200, 100),
    'satisfaction': np.random.uniform(3.5, 5.0, 100)
})

# prepare features and target
X = df.drop(columns=['sales'])
y = df['sales']

# get model from sklearn
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_squared_error, r2_score

# train and log the model with MLflow
with mlflow.start_run(run_name="random_forest_example12"):
    # Create and train the model
    mlflow.sklearn.autolog()
    model = RandomForestRegressor(n_estimators=2, random_state=42)
    model.fit(X, y)

    # Make predictions and calculate metrics
    predictions = model.predict(X)
    mse = mean_squared_error(y, predictions)
    r2 = r2_score(y, predictions)

    # Log metrics
    metrics = dict(mse=mse, r2=r2)
    mlflow.log_metrics(metrics)

    # Create an input example
    input_example = X.iloc[[0]]  # Using the first row as an example

    # Log the model with signature and input example
    print("logging model")
    mlflow.sklearn.log_model(
        model,
        "random_forest_model",
        input_example=input_example,  # Add input example
        signature=mlflow.models.infer_signature(X, predictions)  # Add model signature
    )