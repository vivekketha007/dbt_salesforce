{{ config(materialized='incremental') }}

with campaign1 as (select distinct ID, NAME, TYPE, STATUS from {{source('DEVELOPER_DB','CAMPAIGN')}}
where date(CREATED_DATE)='2022-12-13'or date(LAST_MODIFIED_DATE)='2022-12-13')

select ID, NAME, TYPE, STATUS, current_timestamp() as Load_Time from campaign1