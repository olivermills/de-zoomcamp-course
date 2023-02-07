## Q1: How many rows does that dataset have?
447,770 - code output below

```
18:35:27.414 | INFO    | Task run 'clean-b9fd7e03-0' - rows: 447770
18:35:27.453 | INFO    | Task run 'clean-b9fd7e03-0' - Finished in state Completed()
18:35:27.500 | INFO    | Flow run 'optimal-robin' - Created task run 'write_local-f322d1be-0' for task 'write_local'
18:35:27.502 | INFO    | Flow run 'optimal-robin' - Executing 'write_local-f322d1be-0' immediately...
18:35:29.296 | INFO    | Task run 'write_local-f322d1be-0' - Finished in state Completed()
18:35:29.341 | INFO    | Flow run 'optimal-robin' - Created task run 'write_gcs-1145c921-0' for task 'write_gcs'
18:35:29.343 | INFO    | Flow run 'optimal-robin' - Executing 'write_gcs-1145c921-0' immediately...
18:35:29.527 | INFO    | Task run 'write_gcs-1145c921-0' - Getting bucket 'prefect-de-zoomcamp-om'.
18:35:29.696 | INFO    | Task run 'write_gcs-1145c921-0' - Uploading from PosixPath('data/green/green_tripdata_2020-01.parquet') to the bucket 'prefect-de-zoomcamp-om' path 'data/green/green_tripdata_2020-01.parquet'.
18:35:30.149 | INFO    | Task run 'write_gcs-1145c921-0' - Finished in state Completed()
18:35:30.200 | INFO    | Flow run 'optimal-robin' - Finished in state Completed('All states completed.')
```

## Q2. Using the flow in etl_web_to_gcs.py, create a deployment to run on the first of every month at 5am UTC. What’s the cron schedule for that?
0 5 1 * *

```
(zoomcamp) olivermills@de-zoomcamp2:~/prefect-zoomcamp$ prefect deployment build flows/03_deployments/parameterized_flow.py:etl_parent_flow -n cron_test --cron "0 5 1 * *" -a
Found flow 'etl-parent-flow'
Deployment YAML created at '/home/olivermills/prefect-zoomcamp/etl_parent_flow-deployment.yaml'.
Deployment storage None does not have upload capabilities; no files uploaded.  Pass --skip-upload to suppress this warning.
Deployment 'etl-parent-flow/cron_test' successfully created with id 'e3407720-1d56-44f1-88d6-15ddba4aeea6'.

To execute flow runs from this deployment, start an agent that pulls work from the 'default' work queue:
$ prefect agent start -q 'default'
```

## Q3. Make sure you have the parquet data files for Yellow taxi data for Feb. 2019 and March 2019 loaded in GCS. Run your deployment to append this data to your BiqQuery table. How many rows did your flow code process?

```
(zoomcamp) olivermills@de-zoomcamp2:~/prefect-zoomcamp$ python flows/02_gcp/etl_gcs_to_bq.py
10:20:23.764 | INFO    | prefect.engine - Created flow run 'violet-collie' for flow 'etl-parent-flow'
10:20:24.043 | INFO    | Flow run 'violet-collie' - Created subflow run 'stoic-monkey' for flow 'etl-gcs-to-bq'
10:20:24.154 | INFO    | Flow run 'stoic-monkey' - Created task run 'extract_from_gcs-968e3b65-0' for task 'extract_from_gcs'
10:20:24.156 | INFO    | Flow run 'stoic-monkey' - Executing 'extract_from_gcs-968e3b65-0' immediately...
10:20:24.469 | INFO    | Task run 'extract_from_gcs-968e3b65-0' - Downloading blob named data/yellow/yellow_tripdata_2019-02.parquet from the prefect-de-zoomcamp-om bucket to ../data/data/yellow/yellow_tripdata_2019-02.parquet
10:20:26.449 | INFO    | Task run 'extract_from_gcs-968e3b65-0' - Finished in state Completed()
10:20:26.497 | INFO    | Flow run 'stoic-monkey' - Created task run 'transform-a7d916b4-0' for task 'transform'
10:20:26.499 | INFO    | Flow run 'stoic-monkey' - Executing 'transform-a7d916b4-0' immediately...
10:20:28.182 | INFO    | Task run 'transform-a7d916b4-0' - Finished in state Completed()
7019375
10:20:28.222 | INFO    | Flow run 'stoic-monkey' - Created task run 'write_bq-b366772c-0' for task 'write_bq'
10:20:28.223 | INFO    | Flow run 'stoic-monkey' - Executing 'write_bq-b366772c-0' immediately...
10:21:11.220 | INFO    | Task run 'write_bq-b366772c-0' - Finished in state Completed()
10:21:11.283 | INFO    | Flow run 'stoic-monkey' - Finished in state Completed('All states completed.')
10:21:11.416 | INFO    | Flow run 'violet-collie' - Created subflow run 'icy-chinchilla' for flow 'etl-gcs-to-bq'
10:21:11.537 | INFO    | Flow run 'icy-chinchilla' - Created task run 'extract_from_gcs-968e3b65-0' for task 'extract_from_gcs'
10:21:11.538 | INFO    | Flow run 'icy-chinchilla' - Executing 'extract_from_gcs-968e3b65-0' immediately...
10:21:11.852 | INFO    | Task run 'extract_from_gcs-968e3b65-0' - Downloading blob named data/yellow/yellow_tripdata_2019-03.parquet from the prefect-de-zoomcamp-om bucket to ../data/data/yellow/yellow_tripdata_2019-03.parquet
10:21:13.857 | INFO    | Task run 'extract_from_gcs-968e3b65-0' - Finished in state Completed()
10:21:13.900 | INFO    | Flow run 'icy-chinchilla' - Created task run 'transform-a7d916b4-0' for task 'transform'
10:21:13.902 | INFO    | Flow run 'icy-chinchilla' - Executing 'transform-a7d916b4-0' immediately...
10:21:16.861 | INFO    | Task run 'transform-a7d916b4-0' - Finished in state Completed()
7832545
10:21:16.903 | INFO    | Flow run 'icy-chinchilla' - Created task run 'write_bq-b366772c-0' for task 'write_bq'
10:21:16.904 | INFO    | Flow run 'icy-chinchilla' - Executing 'write_bq-b366772c-0' immediately...
10:22:05.391 | INFO    | Task run 'write_bq-b366772c-0' - Finished in state Completed()
10:22:05.446 | INFO    | Flow run 'icy-chinchilla' - Finished in state Completed('All states completed.')
10:22:05.493 | INFO    | Flow run 'violet-collie' - Finished in state Completed('All states completed.')
```
7019375 + 7832545 = 14851920

## Q4. Run your deployment in a local subprocess (the default if you don’t specify an infrastructure). Use the Green taxi data for the month of November 2020.

How many rows were processed by the script?