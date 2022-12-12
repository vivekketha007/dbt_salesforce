{{ config(materialized='table') }}

with campaign1 as (select distinct ID, NAME, TYPE, STATUS from {{source('DEVELOPER_DB','CAMPAIGN')}})

select ID, NAME, TYPE, STATUS, current_timestamp() as Load_Time from campaign1