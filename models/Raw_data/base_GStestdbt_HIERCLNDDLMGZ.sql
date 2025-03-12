{{ config(materialized = 'table', alias = 'HIERCLNDDLMGZ') }}

with source as (
    select * from {{ source('GStestdbt', 'HIERCLNDDLMGZ') }}
),

renamed as (
    select
        CAST("FSCLDT_ID" as number) as "FSCLDT_ID",
        "FSCLDT_LABEL",
        CAST("FSCLWK_ID" as number) as "FSCLWK_ID",
        "FSCLWK_LABEL",
        CAST("FSCLMTH_ID" as number) as "FSCLMTH_ID",
        "FSCLMTH_LABEL",
        CAST("FSCLQRTR_ID" as number) as "FSCLQRTR_ID",
        "FSCLQRTR_LABEL",
        CAST("FSCLYR_ID" as number) as "FSCLYR_ID",
        CAST("FSCLYR_LABEL" as number) as "FSCLYR_LABEL",
        "SSN_ID",
        "SSN_LABEL",
        CAST("LY_FSCLDT_ID" as number) as "LY_FSCLDT_ID",
        CAST("LLY_FSCLDT_ID" as number) as "LLY_FSCLDT_ID",
        CAST("FSCLDOW" as number) as "FSCLDOW",
        CAST("FSCLDOM" as number) as "FSCLDOM",
        CAST("FSCLDOQ" as number) as "FSCLDOQ",
        CAST("FSCLDOY" as number) as "FSCLDOY",
        CAST("FSCLWOY" as number) as "FSCLWOY",
        CAST("FSCLMOY" as number) as "FSCLMOY",
        CAST("FSCLQOY" as number) as "FSCLQOY",
        CAST("DATE" as date) as "DATE"
    from source
    where "FSCLDT_ID" != 'fscldt_id'
)

select * from renamed
