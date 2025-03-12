{{ config(materialized = 'table', alias = 'FACTTRANSACTIONSDLMGZ') }}

with source as (
    select * from {{ source('GStestdbt', 'FACTTRANSACTIONSDLMGZ') }}
),

renamed as (
    select
        CAST("ORDER_ID" as number) as "ORDER_ID",
        CAST("LINE_ID" as number) as "LINE_ID",
        "TYPE",
        CAST("DT" as timestamp) as "DT",
        "POS_SITE_ID",
        "SKU_ID",
        CAST("FSCLDT_ID" as number) as "FSCLDT_ID",
        "PRICE_SUBSTATE_ID",
        CAST("SALES_UNITS" as number) as "SALES_UNITS",
        CAST("SALES_DOLLARS" as float) as "SALES_DOLLARS",
        CAST("DISCOUNT_DOLLARS" as float) as "DISCOUNT_DOLLARS",
        CAST("ORIGINAL_ORDER_ID" as number) as "ORIGINAL_ORDER_ID",
        CAST("ORIGINAL_LINE_ID" as number) as "ORIGINAL_LINE_ID"
    from source
    where "ORDER_ID" != 'order_id'
)

select * from renamed
