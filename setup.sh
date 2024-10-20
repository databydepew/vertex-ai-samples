#!/bin/bash

# Get all buckets in the project
BUCKETS=$(gsutil ls)

# Loop through each bucket and disable uniform bucket-level access
for BUCKET in $BUCKETS; do
  echo "Disabling Uniform Bucket-Level Access for $BUCKET"
  gsutil uniformbucketlevelaccess set off $BUCKET
done

echo "Uniform Bucket-Level Access disabled for all buckets in the project."



# python -m pip install --upgrade pip 

# python -m pip install -r requirements.txt

# pip install google-cloud-automlops



# PROJECT_NUMBER=594561909379
# gcloud projects add-iam-policy-binding mlops-poc-vertexai \
# --member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
# --role="roles/storage.admin"

# gcloud projects add-iam-policy-binding mlops-poc-vertexai \
# --member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
# --role="roles/aiplatform.admin"

# gcloud projects add-iam-policy-binding mlops-poc-vertexai \
# --member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
# --role="roles/iam.serviceAccountUser"

# gcloud projects add-iam-policy-binding mlops-poc-vertexai \
# --member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
# --role="roles/logging.logWriter"