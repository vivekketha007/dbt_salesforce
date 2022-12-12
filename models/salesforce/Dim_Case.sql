{{ config(materialized='table') }}

with case1 as (select distinct Id, SUPPLIED_NAME, SUPPLIED_COMPANY, TYPE, STATUS, REASON, PRIORITY, POTENTIAL_LIABILITY_C from {{source('DEVELOPER_DB','CASE')}})

select Id, SUPPLIED_NAME, SUPPLIED_COMPANY, TYPE, STATUS, REASON, PRIORITY, POTENTIAL_LIABILITY_C, current_timestamp() as Load_Time from case1