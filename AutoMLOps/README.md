# AutoMLOps - Generated Code Directory

**Note: This directory contains code generated using AutoMLOps**

AutoMLOps is a service that generates a production ready MLOps pipeline from Jupyter Notebooks, bridging the gap between Data Science and DevOps and accelerating the adoption and use of Vertex AI. The service generates an MLOps codebase for users to customize, and provides a way to build and manage a CI/CD integrated MLOps pipeline from the notebook. AutoMLOps automatically builds a source repo for versioning, cloudbuild configs and triggers, an artifact registry for storing custom components, gs buckets, service accounts and updated IAM privs for running pipelines, enables APIs (cloud Run, Cloud Build, Artifact Registry, etc.), creates a runner service API in Cloud Run for submitting PipelineJobs to Vertex AI, and a Cloud Scheduler job for submitting PipelineJobs on a recurring basis. These automatic integrations empower data scientists to take their experiments to production more quickly, allowing them to focus on what they do best: providing actionable insights through data.

# User Guide

For a user-guide, please view these [slides](https://github.com/GoogleCloudPlatform/automlops/blob/main/AutoMLOps_Implementation_Guide_External.pdf).

# Layout

```bash
.
├── components                                     : Custom vertex pipeline components.
    ├──component_base                              : Contains all the python files, Dockerfile and requirements.txt
        ├── Dockerfile                             : Dockerfile containing all the python files for the components.
        ├── requirements.txt                       : Package requirements for all the python files for the components.
        ├── src                                    : Python source code directory.
            ├──component_a.py                      : Python file containing code for the component.
            ├──...(for each component)
    ├──component_a                                 : Components specs generated using AutoMLOps
        ├── component.yaml                         : Component yaml spec, acts as an I/O wrapper around the Docker container.
    ├──...(for each component)
├── configs                                        : Configurations for defining vertex ai pipeline and MLOps infra.
    ├── defaults.yaml                              : Runtime configuration variables.
├── images                                         : Custom container images for training models (optional).
├── pipelines                                      : Vertex ai pipeline definitions.
    ├── pipeline.py                                : Full pipeline definition; compiles pipeline spec and uploads to GCS.
    ├── pipeline_runner.py                         : Sends a PipelineJob to Vertex AI.
    ├── requirements.txt                           : Package requirements for running pipeline.py.
    ├── runtime_parameters                         : Variables to be used in a PipelineJob.
        ├── pipeline_parameter_values.json         : Json containing pipeline parameters.
├── provision                                      : Provision configurations and details.
    ├── provision_resources.sh                     : Provisions the necessary infra to run the MLOps pipeline.
    ├── provisioning_configs                       : (Optional) Relevant terraform/Pulumi config files for provisioning infa.
├── scripts                                        : Scripts for manually triggering the cloud run service.
    ├── build_components.sh                        : Submits a Cloud Build job that builds and pushes the components to the registry.
    ├── build_pipeline_spec.sh                     : Compiles the pipeline specs.
    ├── run_pipeline.sh                            : Submit the PipelineJob to Vertex AI.
    ├── run_all.sh                                 : Builds components, compiles pipeline specs, and submits the PipelineJob.
    ├── publish_to_topic.sh                        : Publishes a message to a Pub/Sub topic to invoke the pipeline job submission service.
├── services                                       : MLOps services related to continuous training.
    ├── submission_service                         : REST API service used to submit pipeline jobs to Vertex AI.
        ├── Dockerfile                             : Dockerfile for running the REST API service.
        ├── requirements.txt                       : Package requirements for the REST API service.
        ├── main.py                                : Python REST API source code. 
├── README.md                                      : Readme markdown file describing the contents of the generated directories.
└── cloudbuild.yaml                                : Cloudbuild configuration file for building custom components.
```