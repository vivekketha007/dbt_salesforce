{{ config(materialized='incremental') }}

with case1 as (select distinct Id, SUPPLIED_NAME, SUPPLIED_COMPANY, TYPE, STATUS, REASON, PRIORITY, POTENTIAL_LIABILITY_C from {{source('DEVELOPER_DB','CASE')}}
where date(CREATED_DATE)='2022-12-13'or date(LAST_MODIFIED_DATE)='2022-12-13')

select Id, SUPPLIED_NAME, SUPPLIED_COMPANY, TYPE, STATUS, REASON, PRIORITY, POTENTIAL_LIABILITY_C, current_timestamp() as Load_Time from case1