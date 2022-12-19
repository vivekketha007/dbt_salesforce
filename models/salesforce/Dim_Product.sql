{{ config(materialized='incremental') }}

with product as (select distinct Id, NAME, IS_ACTIVE, PRODUCT_CODE from {{source('DEVELOPER_DB','PRODUCT_2')}}
where date(CREATED_DATE)='2022-12-13'or date(LAST_MODIFIED_DATE)='2022-12-13')

select Id, Name, IS_ACTIVE, PRODUCT_CODE, current_timestamp() as Load_Time from product 