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

def create_dataset(bq_table: str, data_path: str, project_id: str):
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
