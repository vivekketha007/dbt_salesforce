{{ config(materialized='incremental') }}

with contact1 as (select distinct ID, NAME, MAILING_STREET, MAILING_CITY, MAILING_STATE, MAILING_POSTAL_CODE, MAILING_COUNTRY,PHONE, MOBILE_PHONE, EMAIL from {{source('DEVELOPER_DB','CONTACT')}}
where date(CREATED_DATE)='2022-12-13'or date(LAST_MODIFIED_DATE)='2022-12-13')

select ID, NAME, MAILING_STREET, MAILING_CITY, MAILING_STATE, MAILING_POSTAL_CODE, MAILING_COUNTRY,PHONE, MOBILE_PHONE, EMAIL, current_timestamp() as Load_Time from contact1