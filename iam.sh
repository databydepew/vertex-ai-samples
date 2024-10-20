PROJECT_NUMBER=594561909379
gcloud projects add-iam-policy-binding mlops-poc-vertexai \
--member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
--role="roles/storage.admin"

gcloud projects add-iam-policy-binding mlops-poc-vertexai \
--member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
--role="roles/aiplatform.admin"

gcloud projects add-iam-policy-binding mlops-poc-vertexai \
--member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
--role="roles/iam.serviceAccountUser"

gcloud projects add-iam-policy-binding mlops-poc-vertexai \
--member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
--role="roles/logging.logWriter"

gcloud projects add-iam-policy-binding mlops-poc-vertexai \
--member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
--role="roles/monitoring.metricWriter"

gcloud projects add-iam-policy-binding mlops-poc-vertexai \
--member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
--role="roles/cloudbuild.builds.admin"
