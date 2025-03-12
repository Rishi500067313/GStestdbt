{{ config(materialized = 'table', alias = 'FACTAVERAGECOSTSDLMGZ') }}

with source as (
    select * from {{ source('GStestdbt', 'FACTAVERAGECOSTSDLMGZ') }}
),

renamed as (
    select
        CAST("FSCLDT_ID" as number) as "FSCLDT_ID",
        "SKU_ID",
        CAST("AVERAGE_UNIT_STANDARDCOST" as float) as "AVERAGE_UNIT_STANDARDCOST",
        CAST("AVERAGE_UNIT_LANDEDCOST" as float) as "AVERAGE_UNIT_LANDEDCOST"
    from source
    where "FSCLDT_ID" != 'fscldt_id'
)

select * from renamed
