{{ config(materialized='table') }}

with account1 as (select distinct ID, NAME, TYPE, BILLING_STREET, BILLING_CITY, BILLING_STATE, BILLING_POSTAL_CODE,BILLING_COUNTRY, SHIPPING_STREET, SHIPPING_CITY,
SHIPPING_STATE, SHIPPING_POSTAL_CODE, SHIPPING_COUNTRY, INDUSTRY, OWNERSHIP, RATING, UPSELL_OPPORTUNITY_C, CUSTOMER_PRIORITY_C, ACTIVE_C from {{source('DEVELOPER_DB','ACCOUNT')}})

select ID, NAME, TYPE, BILLING_STREET, BILLING_CITY, BILLING_STATE, BILLING_POSTAL_CODE,BILLING_COUNTRY, SHIPPING_STREET, SHIPPING_CITY,
SHIPPING_STATE, SHIPPING_POSTAL_CODE, SHIPPING_COUNTRY, INDUSTRY, OWNERSHIP, RATING, UPSELL_OPPORTUNITY_C, CUSTOMER_PRIORITY_C, ACTIVE_C, current_timestamp() as Load_Time from account1