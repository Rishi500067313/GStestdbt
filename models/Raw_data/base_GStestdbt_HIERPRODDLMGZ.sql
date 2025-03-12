{{ config(materialized = 'table', alias = 'HIERPRODDLMGZ') }}

with source as (
    select * from {{ source('GStestdbt', 'HIERPRODDLMGZ') }}
),

renamed as (
    select
        "SKU_ID",
        "SKU_LABEL",
        "STYLCLR_ID",
        "STYLCLR_LABEL",
        "STYL_ID",
        "STYL_LABEL",
        CAST("SUBCAT_ID" as number) as "SUBCAT_ID",
        "SUBCAT_LABEL",
        CAST("CAT_ID" as number) as "CAT_ID",
        "CAT_LABEL",
        CAST("DEPT_ID" as number) as "DEPT_ID",
        "DEPT_LABEL",
        CAST("ISSVC" as number) as "ISSVC",
        CAST("ISASMBLY" as number) as "ISASMBLY",
        CAST("ISNFS" as number) as "ISNFS"
    from source
    where "SKU_ID" != 'sku_id'
)

select * from renamed
