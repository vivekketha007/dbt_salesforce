{{ config(materialized='table') }}

with contract1 as (select distinct ID, BILLING_STREET, BILLING_CITY, BILLING_STATE, BILLING_POSTAL_CODE, BILLING_COUNTRY, STATUS, COMPANY_SIGNED_ID, CUSTOMER_SIGNED_ID, 
CUSTOMER_SIGNED_TITLE, CUSTOMER_SIGNED_DATE from {{source('DEVELOPER_DB','CONTRACT')}})

select ID, BILLING_STREET, BILLING_CITY, BILLING_STATE, BILLING_POSTAL_CODE, BILLING_COUNTRY, STATUS, COMPANY_SIGNED_ID, CUSTOMER_SIGNED_ID, 
CUSTOMER_SIGNED_TITLE, CUSTOMER_SIGNED_DATE, current_timestamp() as Load_Time from contract1