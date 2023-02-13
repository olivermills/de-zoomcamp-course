from pathlib import Path
import pandas as pd
from prefect import flow, task
from prefect_gcp.cloud_storage import GcsBucket
from random import randint
from prefect.tasks import task_input_hash
from datetime import timedelta


@task(retries=3)
def fetch(dataset_url: str) -> pd.DataFrame:
    """Read fhv data from web into pandas DataFrame"""
    dtype_cols = {
        "dispatching_base_num": "string",
        "PUlocationID": "float64",
        "DOlocationID": "float64",
        "SR_Flag": "float64",
        "Affiliated_base_number": "string",
    }
    df = pd.read_csv(dataset_url, dtype=dtype_cols)
    return df


@task()
def write_local(df: pd.DataFrame, dataset_file: str) -> Path:
    """Write DataFrame out locally as parquet file"""
    path = Path(f"data/fhv/{dataset_file}.csv.gz")
    df.to_csv(path, compression="gzip")
    return path


@task()
def write_gcs(path: Path) -> None:
    """Upload local parquet file to GCS"""
    gcs_block = GcsBucket.load("zoom-gcs")
    gcs_block.upload_from_path(from_path=path, to_path=path)
    return

#https://github.com/DataTalksClub/nyc-tlc-data/releases/download/fhv/fhv_tripdata_2019-01.csv.gz

@flow()
def etl_web_to_gcs(year: int, month: int) -> None:
    """The main ETL function"""
    dataset_file = f"fhv_tripdata_{year}-{month}"
    dataset_url = f"https://github.com/DataTalksClub/nyc-tlc-data/releases/download/fhv/{dataset_file}.csv.gz"

    df = fetch(dataset_url)
    path = write_local(df, dataset_file)
    write_gcs(path)


@flow()
def etl_parent_flow(
    months: list[int] = [10, 11, 12], year: int = 2019
):
    for month in months:
        etl_web_to_gcs(year, month)


if __name__ == "__main__":
    months = [10, 11, 12]
    year = 2019
    etl_parent_flow(months, year)
