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

import argparse
import json
from kfp.dsl import executor

import kfp
from kfp import dsl
from kfp.dsl import *
from typing import *

def deploy_model(
    model_directory: str,
    project_id: str,
    region: str,
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

def main():
    """Main executor."""
    parser = argparse.ArgumentParser()
    parser.add_argument('--executor_input', type=str)
    parser.add_argument('--function_to_execute', type=str)

    args, _ = parser.parse_known_args()
    executor_input = json.loads(args.executor_input)
    function_to_execute = globals()[args.function_to_execute]

    executor.Executor(
        executor_input=executor_input,
        function_to_execute=function_to_execute).execute()

if __name__ == '__main__':
    main()
