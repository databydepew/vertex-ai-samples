# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# DISCLAIMER: This code is generated as part of the AutoMLOps output.

variable "artifact_repo_location" {
  description   = "Region of the artifact repo (default use with Artifact Registry)."
  type          = string
}

variable "artifact_repo_name" {
  description   = "Artifact repo name where components are stored (default use with Artifact Registry)."
  type          = string
}

variable "build_trigger_location" {
  description   = "The location of the build trigger (for cloud build)."
  type          = string
}

variable "build_trigger_name" {
  description   = "The name of the build trigger (for cloud build)."
  type          = string
}

variable "pipeline_job_runner_service_account_short" {
  description   = "Service Account to run PipelineJobs (string before '@')."
  type          = string
}

variable "pipeline_job_submission_service_location" {
  description   = "The location of the cloud submission service."
  type          = string
}

variable "pipeline_job_submission_service_name" {
  description   = "The name of the cloud submission service."
  type          = string
}

variable "project_id" {
  description   = "The ID of the project in which to provision resources."
  type          = string
}

variable "provision_credentials_key" {
  description = "Either a path to or the contents of a service account key file in JSON format."
  type        = string
}

variable "pubsub_topic_name" {
  description   = "The name of the pubsub topic to publish to."
  type          = string
}

variable "schedule_location" {
  description   = "The location of the scheduler resource."
  type          = string
}

variable "schedule_name" {
  description   = "The name of the scheduler resource."
  type          = string
}

variable "schedule_pattern" {
  description   = "Cron formatted value used to create a ccheduled retrain job."
  type          = string
}

variable "source_repo_branch" {
  description   = "The branch to use in the source repository."
  type          = string
}

variable "source_repo_name" {
  description   = "The name of the source repository to use."
  type          = string
}

variable "storage_bucket_location" {
  description   = "Region of the GS bucket."
  type          = string
}

variable "storage_bucket_name" {
  description   = "GS bucket name where pipeline run metadata is stored."
  type          = string
}

variable "vpc_connector" {
  description   = "The name of the vpc connector to use."
  type          = string
}