{{ config(materialized ="view") }}

select  cast(int64_field_0 as integer)          as fhv_id,
        dispatching_base_num                    as dispatching_base_number,
        cast(pickup_datetime as timestamp)      as pickup_datetime,
        cast(dropoff_datetime as timestamp)     as dropoff_datetime,
        cast(pulocationid as numeric)           as pickup_locationid,
        cast(dolocationid as numeric)           as dropoff_locationid,
        cast(sr_flag as numeric)                as sr_flag,
        affiliated_base_number          
from    {{ source('staging','fhv_trip_data_2019_partitioned_clustered') }}

-- dbt build --m <model.sql> --var 'is_test_run: false'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}