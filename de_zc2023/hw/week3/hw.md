## Q1. What is the count for fhv vehicle records for year 2019?

```
create or replace external table pristine-flames-375008.zoomcamp.fhv_trip_data_2019
options (
  format = 'CSV',
  uris = ['gs://prefect-de-zoomcamp-om/data/fhv/fhv_tripdata_2019*']
)

create or replace table pristine-flames-375008.zoomcamp.fhv_trip_data_2019_materialised as
select * from pristine-flames-375008.zoomcamp.fhv_trip_data_2019

select count(*) from pristine-flames-375008.zoomcamp.fhv_trip_data_2019
select count(*) from pristine-flames-375008.zoomcamp.fhv_trip_data_2019_materialised
```
43244696

## Q2. Write a query to count the distinct number of affiliated_base_number for the entire dataset on both the tables. What is the estimated amount of data that will be read when this query is executed on the External Table and the Table?

```
select count(distinct affiliated_base_number) from pristine-flames-375008.zoomcamp.fhv_trip_data_2019
select count(distinct affiliated_base_number) from pristine-flames-375008.zoomcamp.fhv_trip_data_2019_materialised
```
0 MB for the External Table and 317.94MB for the BQ Table

## Q3. How many records have both a blank (null) PUlocationID and DOlocationID in the entire dataset?

```
select  count(*) 
from    pristine-flames-375008.zoomcamp.fhv_trip_data_2019
where   PULocationID is null 
and     DOLocationID is null
```
717,748

## Q4. What is the best strategy to optimize the table if query always filter by pickup_datetime and order by affiliated_base_number?
Partition by pickup_datetime Cluster on affiliated_base_number

## Q5. Use the BQ table you created earlier in your from clause and note the estimated bytes. Now change the table in the from clause to the partitioned table you created for question 4 and note the estimated bytes processed. What are these values? Choose the answer which most closely matches.

```
create or replace table pristine-flames-375008.zoomcamp.fhv_trip_data_2019_partitioned_clustered
partition by
date(pickup_datetime)
cluster by affiliated_base_number as
select * from pristine-flames-375008.zoomcamp.fhv_trip_data_2019
```

```
select  count(distinct affiliated_base_number)
from    pristine-flames-375008.zoomcamp.fhv_trip_data_2019_materialised
where   date(pickup_datetime) >= '2019-03-01'
and     date(pickup_datetime) <= '2019-03-31'

select  count(distinct affiliated_base_number)
from    pristine-flames-375008.zoomcamp.fhv_trip_data_2019_partitioned_clustered
where   date(pickup_datetime) >= '2019-03-01'
and     date(pickup_datetime) <= '2019-03-31'
```

647.87 MB for non-partitioned table and 23.06 MB for the partitioned table

## Q6. Where is the data stored in the External Table you created?
GCP Bucket


## Q7. It is best practice in Big Query to always cluster your data:
False