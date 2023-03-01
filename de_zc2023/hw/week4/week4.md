## Q1
```
select count(*) from `production.fact_trips`
where extract(year from pickup_datetime) in (2019,2020)
```
61604750

## Q2
10.2% (green)
89.8% (yellow)

## Q3
```
SELECT count(1) FROM `pristine-flames-375008.dbt_omills.stg_fhv_tripdata`
where extract(year from pickup_datetime) = 2019
```
43244696

## Q4
```
SELECT count(1) FROM `pristine-flames-375008.dbt_omills.fact_fhv_trips`
where extract(year from pickup_datetime) = 2019
```
22998722

## Q5
```
SELECT    count(1)
          ,extract(month from pickup_datetime)
FROM      `pristine-flames-375008.dbt_omills.fact_fhv_trips`
where     extract(year from pickup_datetime) = 2019
group by  extract(month from pickup_datetime)
order by  count(1) desc
```
January = 19,849,151 trips