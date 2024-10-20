PROJECT_NUMBER=1043390106779
gcloud projects add-iam-policy-binding poc-databydepew \
--member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
--role="roles/storage.admin"

gcloud projects add-iam-policy-binding poc-databydepew \
--member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
--role="roles/aiplatform.admin"

gcloud projects add-iam-policy-binding poc-databydepew \
--member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
--role="roles/iam.serviceAccountUser"

gcloud projects add-iam-policy-binding poc-databydepew \
--member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
--role="roles/iam.serviceAccountTokenCreator"

gcloud projects add-iam-policy-binding poc-databydepew \
--member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
--role="roles/resourcemanager.projectIamAdmin"

gcloud projects add-iam-policy-binding poc-databydepew \
--member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
--role="roles/cloudfunctions.admin"

gcloud projects add-iam-policy-binding poc-databydepew \
--member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
--role="roles/logging.logWriter"

gcloud projects add-iam-policy-binding poc-databydepew \
--member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
--role="roles/monitoring.metricWriter"

gcloud projects add-iam-policy-binding poc-databydepew \
--member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
--role="roles/cloudbuild.builds.builder"

gcloud projects add-iam-policy-binding poc-databydepew \
--member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
--role="roles/artifactregistry.admin"




# resource "google_project_iam_member" "project_iam_binding" {
#   project = google_project.project.project_id

#   # Replace with your user or service account email
#   member = "user:<YOUR_USER_EMAIL>"

#   # Assign multiple roles
#   role = "roles/source.admin"
# }

# resource "google_project_iam_member" "cloudfunctions_admin" {
#   project = google_project.project.project_id
#   member  = "user:<YOUR_USER_EMAIL>"
#   role    = "roles/cloudfunctions.admin"
# }

# resource "google_project_iam_member" "aiplatform_service_agent" {
#   project = google_project.project.project_id
#   member  = "user:<YOUR_USER_EMAIL>"
#   role    = "roles/aiplatform.serviceAgent"
# }

# resource "google_project_iam_member" "cloudbuild_builds_editor" {
#   project = google_project.project.project_id
#   member  = "user:<YOUR_USER_EMAIL>"
#   role    = "roles/cloudbuild.builds.editor"
# }

# resource "google_project_iam_member" "iam_service_account_admin" {
#   project = google_project.project.project_id
#   member  = "user:<YOUR_USER_EMAIL>"
#   role    = "roles/iam.serviceAccountAdmin"
# }

# resource "google_project_iam_member" "pubsub_editor" {
#   project = google_project.project.project_id
#   member  = "user:<YOUR_USER_EMAIL>"
#   role    = "roles/pubsub.editor"
# }

# resource "google_project_iam_member" "cloudscheduler_admin" {
#   project = google_project.project.project_id
#   member  = "user:<YOUR_USER_EMAIL>"
#   role    = "roles/cloudscheduler.admin"
# }

# resource "google_project_iam_member" "artifactregistry_admin" {
#   project = google_project.project.project_id
#   member  = "user:<YOUR_USER_EMAIL>"
#   role    = "roles/artifactregistry.admin"
# }

# resource "google_project_iam_member" "resourcemanager_projectIamAdmin" {
#   project = google_project.project.project_id
#   member  = "user:<YOUR_USER_EMAIL>"
#   role    = "roles/resourcemanager.projectIamAdmin"
# }

# resource "google_project_iam_member" "serviceusage_serviceUsageAdmin" {
#   project = google_project.project.project_id
#   member  = "user:<YOUR_USER_EMAIL>"
#   role    = "roles/serviceusage.serviceUsageAdmin"
# }