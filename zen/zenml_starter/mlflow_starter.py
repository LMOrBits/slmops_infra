import numpy as np
from sklearn.ensemble import RandomForestClassifier
from sklearn.base import BaseEstimator
from sklearn.datasets import load_iris
from zenml import pipeline, step
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import mlflow
from zenml.config import DockerSettings

docker_settings = DockerSettings(
    python_package_installer="uv",

)

@step(experiment_tracker="mlflow_tracker")
def train_model() -> BaseEstimator:
    mlflow.autolog()
    iris = load_iris()
    X_train, X_test, y_train, y_test = train_test_split(
        iris.data, iris.target, test_size=0.2, random_state=42
    )
    model = RandomForestClassifier()
    model.fit(X_train, y_train)
    y_pred = model.predict(X_test)
    mlflow.log_metric("train_accuracy", accuracy_score(y_test, y_pred))
    return model


@pipeline(settings={"docker": docker_settings},enable_cache=False)
def training_pipeline():
    train_model()



if __name__ == "__main__":
  training_pipeline()