{{ config(materialized='incremental') }}

select A.ID as Account_id,o.ID as order_id,opper.ID as opertunity_id,opp.AMOUNT,cap.ID as capaign_id,C.EXPECTED_REVENUE,C.BUDGETED_COST,
C.ACTUAL_COST,L.ID as lead_Id,contract.ID as contract_Id,p.ID as product_id,
contact.ID as contact_id,cases.ID as case_Id,count(A.ID) as
No_Of_Orders from "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."ACCOUNT" as A
left join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_ACCOUNT" as account on A.ID=account.ID
left join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."ORDER" as O on A.ID=O.ACCOUNT_ID

left join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_ORDER" as ord on ord.ID=O.ID and A.ID=O.ACCOUNT_ID
left join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."OPPORTUNITY" as opp on A.ID=opp.ACCOUNT_ID

left join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_OPPORTUNITY" as opper on opper.ID=opp.ID and A.ID=opp.ACCOUNT_ID

left join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."CAMPAIGN" as C on C.ID=opp.CAMPAIGN_ID and A.ID=opp.ACCOUNT_ID
left join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_CAMPAIGN" as cap on cap.ID=C.ID and C.ID=opp.CAMPAIGN_ID and A.ID=opp.ACCOUNT_ID

left join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."LEAD" as Lead on A.ID=Lead.CONVERTED_ACCOUNT_ID
left join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_LEAD" as L on L.ID=Lead.ID and A.ID=Lead.CONVERTED_ACCOUNT_ID

left join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."CONTRACT" as Cr on A.ID=Cr.ACCOUNT_ID
left join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_CONTRACT" as contract on contract.ID=Cr.ID and A.ID=Cr.ACCOUNT_ID



left join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."ORDER_ITEM" as o_i on o_i.ORDER_ID=O.ID and A.ID=O.ACCOUNT_ID
left join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_PRODUCT" as p on p.ID=o_i.PRODUCT_2_ID and o_i.ORDER_ID=O.ID and A.ID=O.ACCOUNT_ID



left join  "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."CONTACT" as Ct on A.ID=Ct.ACCOUNT_ID
left join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_CONTACT" as contact on contact.ID=ct.ID and A.ID=Ct.ACCOUNT_ID



left join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."CASE" as case_s on A.ID=case_s.ACCOUNT_ID
left join "DEVELOPER_DB"."VIVEKKETHA_SCHEMA"."DIM_CASE" as cases on cases.ID=case_s.ID and A.ID=case_s.ACCOUNT_ID

where date(account.Load_Time)='2022-12-13' or date(ord.Load_Time)='2022-12-13' or date(opper.Load_Time)='2022-12-13' 
or date(cap.Load_Time)='2022-12-13' or date(L.Load_Time)='2022-12-13' or date(contract.Load_Time)='2022-12-13' 
or date(p.Load_Time)='2022-12-13' or date(contact.Load_Time)='2022-12-13' or date(cases.Load_Time)='2022-12-13'

group by A.ID,o.ID,opper.ID,opp.AMOUNT,cap.ID,C.EXPECTED_REVENUE,C.BUDGETED_COST,
C.ACTUAL_COST,L.ID,contract.ID,p.ID,contact.ID,cases.ID,A.ID