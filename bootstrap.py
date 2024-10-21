
import datetime

from google_cloud_automlops import AutoMLOps
from google.cloud import storage
from kfp.v2.dsl import component, Input, Output, Dataset, Artifact

@AutoMLOps.component
def train_model(model_directory: str, data_path: str):
    """Custom component that trains a classification model using XGBoost.
    
    Args:
        model_directory: The directory to save the trained model.
        data_path: The GCS location of the training data.
    """
    import pandas as pd
    import xgboost as xgb
    from sklearn.model_selection import train_test_split
    from sklearn.metrics import accuracy_score
    # Load the dataset from GCS
    df = pd.read_csv(data_path)
    
    # Assume the last column is the target variable
    X = df.iloc[:, :-1]  # Features
    y = df.iloc[:, -1]   # Target variable
    
    # Split the dataset into training and testing sets
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    
    # Initialize the XGBoost classifier
    model = xgb.XGBClassifier(use_label_encoder=False, eval_metric='mlogloss')
    
    # Train the model
    model.fit(X_train, y_train)
    
    # Make predictions on the test set
    y_pred = model.predict(X_test)
    
    # Calculate accuracy
    accuracy = accuracy_score(y_test, y_pred)
    print(f"Model trained with accuracy: {accuracy:.2f}")
    
    # Save the trained model
    model.save_model(f"{model_directory}/xgboost_model.json")
    print(f"Model trained and saved to {model_directory}/xgboost_model.json.")

@AutoMLOps.component
def create_dataset_from_gcs(
    gcs_csv_uri: str, 
    project_id: str, 
    region: str, 
    display_name: str, 
    dataset: Output[Dataset]
    ):
    from google.cloud import storage
    from google.cloud import aiplatform
    """Pipeline component to create a Vertex AI Dataset from a CSV in GCS."""
    
    # Initialize Vertex AI
    aiplatform.init(project=project_id, location=region)
    
    # Create a tabular dataset with the CSV source
    dataset_obj = aiplatform.TabularDataset.create(
        display_name=display_name,
        gcs_source=[gcs_csv_uri],
    )
    
    # Output dataset information
    dataset.uri = dataset_obj.resource_name
    print(f"Dataset created: {dataset.uri}")



@AutoMLOps.component
def create_dataset_from_bq(bq_table: str, data_path: str, project_id: str):
    """Custom component that takes in a BigQuery table and writes it to GCS.
    
    Args:
        bq_table: The source BigQuery table.
        data_path: The GCS location to write the CSV.
        project_id: The project ID.
    """
    from google.cloud import bigquery
    # Initialize BigQuery client
    client = bigquery.Client(project=project_id)
    
    # Query the BigQuery table
    query = f"SELECT * FROM `{bq_table}`"
    df = client.query(query).to_dataframe()
    
    # Write the DataFrame to a CSV file in GCS
    df.to_csv(data_path, index=False)
    print(f"Dataset created and written to {data_path}.")



@AutoMLOps.component
def deploy_model(
    model_directory: str,
    project_id: str,
    region: str,
    endpoint_display_name: str,
):
    from google.cloud import aiplatform
    # Initialize the AI Platform
    aiplatform.init(project=project_id, location=region)

    # Create or get the endpoint
    endpoint = aiplatform.Endpoint.create(display_name=endpoint_display_name)

    # Deploy the model to the endpoint
    model = aiplatform.Model(model_directory)
    model.deploy(
        endpoint=endpoint,
        display_name="my-model-{}".format(datetime.datetime.now()),
        traffic_split={"0": 100},  # 100% of the traffic to the new model
    )

    print(f"Model  deployed to endpoint.")

@AutoMLOps.pipeline #(name='automlops-pipeline', description='This is an optional description')
def pipeline(bq_table: str, model_directory: str, data_path: str, project_id: str, region: str):
    create_dataset_task = create_dataset_from_bq(
        bq_table=bq_table,
        data_path=data_path,
        project_id=project_id
    )
    
    train_model_task = train_model(
        model_directory=model_directory,
        data_path=data_path
    ).after(create_dataset_task)
    
    deploy_model_task = deploy_model(
        model_directory=model_directory,
        project_id=project_id,
        region=region
    ).after(train_model_task)
    
    return {"create_dataset_task": create_dataset_task,
            "train_model_task": train_model_task,
            "deploy_model_task": deploy_model_task}
    
    
pipeline_params = {
    "bq_table": "poc-databydepew.test_dataset.dry-beans",
    "model_directory": f"gs://poc-databydepew-bucket/trained_models/{datetime.datetime.now()}",
    "data_path": "gs://poc-databydepew-bucket/data",
    "project_id": "poc-databydepew",
    "region": "us-central1"}


AutoMLOps.generate(project_id="poc-databydepew",
                    use_ci=True,
                    pipeline_params=pipeline_params,
                    naming_prefix="databydepew",
                    provisioning_framework="terraform",
                    source_repo_type = "github",
                    source_repo_name="databydepew/vertex-ai-samples",
                    source_repo_branch= "automlops")



AutoMLOps.provision()
AutoMLOps.deploy()