{{ config(materialized='table') }}

select A.ID as Account_id,o.ID as order_id,opper.ID as OPPORTUNITY_ID,S.OPP_AMOUNT AS OPPORTUNITY_AMOUNT,cap.ID as campaign_id,S.EXPECTED_REVENUE,S.BUDGETED_COST,
S.ACTUAL_COST,L.ID as lead_Id,contract.ID as contract_Id,p.ID as product_id,
contact.ID as contact_id,cases.ID as case_Id,count(S.ID) AS NO_OF_ORDERS from "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."FINAL_STAGE_TABLE_SALES_FORCE" as S

LEFT OUTER join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_ACCOUNT" as A on S.NAME=A.NAME and
S.TYPE=A.TYPE and S.BILLING_STREET=A.BILLING_STREET and S.BILLING_CITY=A.BILLING_CITY and S.BILLING_STATE=A.BILLING_STATE and
S.BILLING_POSTAL_CODE=A.BILLING_POSTAL_CODE and A.BILLING_COUNTRY=S.BILLING_COUNTRY and S.SHIPPING_STREET=A.SHIPPING_STREET and
A.SHIPPING_CITY=S.SHIPPING_CITY and S.SHIPPING_STATE=A.SHIPPING_STATE and S.SHIPPING_POSTAL_CODE=A.SHIPPING_POSTAL_CODE and
S.SHIPPING_COUNTRY=A.SHIPPING_COUNTRY and S.INDUSTRY=A.INDUSTRY and S.OWNERSHIP=A.OWNERSHIP and S.RATING=A.RATING and
S.UPSELL_OPPORTUNITY_C=A.UPSELL_OPPORTUNITY_C and S.CUSTOMER_PRIORITY_C=A.CUSTOMER_PRIORITY_C and S.ACTIVE_C=S.ACTIVE_C


LEFT OUTER join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_ORDER" as o on S.O_STATUS=o.STATUS and S.O_BILLING_STREET=o.BILLING_STREET and
S.O_BILLING_CITY=o.BILLING_CITY and S.O_BILLING_STATE=o.BILLING_STATE and S.O_BILLING_POSTAL_CODE=o.BILLING_POSTAL_CODE and
S.O_BILLING_COUNTRY=o.BILLING_COUNTRY and S.O_SHIPPING_STREET=o.SHIPPING_STREET and S.O_SHIPPING_CITY=o.SHIPPING_CITY and
S.O_SHIPPING_STATE=o.SHIPPING_STATE and S.O_SHIPPING_POSTAL_CODE=o.SHIPPING_POSTAL_CODE and S.O_SHIPPING_COUNTRY=o.SHIPPING_COUNTRY


LEFT OUTER join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_OPPORTUNITY" as opper on S.OPP_NAME=opper.NAME and S.STAGE_NAME=opper.STAGE_NAME and
S.OPP_TYPE=opper.TYPE and S.LEAD_SOURCE=opper.LEAD_SOURCE and S.FORECAST_CATEGORY=opper.FORECAST_CATEGORY and
S.MAIN_COMPETITORS_C=opper.MAIN_COMPETITORS_C


LEFT OUTER join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_CAMPAIGN" as cap on S.CAMP_NAME=cap.NAME and S.CAMP_TYPE=cap.TYPE and S.C_STATUS=cap.STATUS


LEFT OUTER join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_LEAD" as L on S.LAST_NAME=L.LAST_NAME and S.FIRST_NAME=L.FIRST_NAME and
S.L_NAME=L.NAME and S.COMPANY=L.COMPANY and S.STREET=L.STREET and S.CITY=L.CITY and S.STATE=L.STATE and S.POSTAL_CODE=L.POSTAL_CODE
and S.COUNTRY=L.COUNTRY and S.L_STATUS=L.STATUS


LEFT OUTER join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_CONTRACT" as contract on S.CR_BILLING_STREET=contract.BILLING_STREET and
S.CR_BILLING_CITY=contract.BILLING_CITY and S.CR_BILLING_STATE=contract.BILLING_STATE and S.CR_BILLING_POSTAL_CODE=contract.BILLING_POSTAL_CODE
and S.CR_BILLING_COUNTRY=contract.BILLING_COUNTRY and S.CR_STATUS=contract.STATUS and S.COMPANY_SIGNED_ID=contract.COMPANY_SIGNED_ID and
S.CUSTOMER_SIGNED_ID=contract.CUSTOMER_SIGNED_ID and S.CUSTOMER_SIGNED_TITLE=contract.CUSTOMER_SIGNED_TITLE and
S.CUSTOMER_SIGNED_DATE=contract.CUSTOMER_SIGNED_DATE

LEFT OUTER join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_PRODUCT" as p on  S.P_NAME=p.NAME  and S.IS_ACTIVE=p.IS_ACTIVE and S.PRODUCT_CODE=p.PRODUCT_CODE

LEFT OUTER join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_CONTACT" as contact on  S.CT_NAME=contact.NAME and S.MAILING_STREET=contact.MAILING_STREET
and S.MAILING_CITY=contact.MAILING_CITY and S.MAILING_STATE=contact.MAILING_STATE and S.MAILING_POSTAL_CODE=contact.MAILING_POSTAL_CODE
and S.MAILING_COUNTRY=contact.MAILING_COUNTRY and S.PHONE=contact.PHONE and S.MOBILE_PHONE=contact.MOBILE_PHONE and S.EMAIL=contact.EMAIL


LEFT OUTER join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_CASE" as cases on S.SUPPLIED_NAME=cases.SUPPLIED_NAME
and S.SUPPLIED_COMPANY=cases.SUPPLIED_COMPANY and S.CS_TYPE=cases.TYPE and S.CS_STATUS=cases.STATUS and S.REASON=cases.REASON and
S.PRIORITY=cases.PRIORITY and S.POTENTIAL_LIABILITY_C=cases.POTENTIAL_LIABILITY_C 


group by A.ID,o.ID,opper.ID,S.OPP_AMOUNT,cap.ID,S.EXPECTED_REVENUE,S.BUDGETED_COST,
S.ACTUAL_COST,L.ID,contract.ID,p.ID,
contact.ID,cases.ID,S.ID