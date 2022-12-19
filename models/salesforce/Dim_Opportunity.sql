{{ config(materialized='incremental') }}

with opportunity1 as (select distinct ID, NAME, STAGE_NAME, TYPE, LEAD_SOURCE, FORECAST_CATEGORY, MAIN_COMPETITORS_C from {{source('DEVELOPER_DB','OPPORTUNITY')}}
where date(CREATED_DATE)='2022-12-13'or date(LAST_MODIFIED_DATE)='2022-12-13')

select ID, NAME, STAGE_NAME, TYPE, LEAD_SOURCE, FORECAST_CATEGORY, MAIN_COMPETITORS_C, current_timestamp() as Load_Time from opportunity1