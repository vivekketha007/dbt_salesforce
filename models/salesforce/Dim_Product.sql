{{ config(materialized='table') }}

with product as (select distinct Id, NAME, IS_ACTIVE, PRODUCT_CODE from {{source('DEVELOPER_DB','PRODUCT_2')}})

select Id, Name, IS_ACTIVE, PRODUCT_CODE, current_timestamp() as Load_Time from product 