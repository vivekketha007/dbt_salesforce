{{ config(materialized='incremental') }}

with lead1 as (select distinct ID, LAST_NAME, FIRST_NAME, NAME, COMPANY, STREET, CITY,STATE, POSTAL_CODE, COUNTRY, STATUS from {{source('DEVELOPER_DB','LEAD')}}
where date(CREATED_DATE)='2022-12-13'or date(LAST_MODIFIED_DATE)='2022-12-13')

select ID, LAST_NAME, FIRST_NAME, NAME, COMPANY, STREET, CITY,STATE, POSTAL_CODE, COUNTRY, STATUS, current_timestamp() as Load_Time from lead1