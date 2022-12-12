{{ config(materialized='table') }}

with opportunity1 as (select distinct ID, NAME, STAGE_NAME, TYPE, LEAD_SOURCE, FORECAST_CATEGORY, MAIN_COMPETITORS_C from {{source('DEVELOPER_DB','OPPORTUNITY')}})

select ID, NAME, STAGE_NAME, TYPE, LEAD_SOURCE, FORECAST_CATEGORY, MAIN_COMPETITORS_C, current_timestamp() as Load_Time from opportunity1