{{ config(materialized = 'table', alias = 'HIERPOSSITEDLMGZ') }}

with source as (
    select * from {{ source('GStestdbt', 'HIERPOSSITEDLMGZ') }}
),

renamed as (
    select
        "SITE_ID",
        "SITE_LABEL",
        "SUBCHNL_ID",
        "SUBCHNL_LABEL",
        "CHNL_ID",
        "CHNL_LABEL"
    from source
    where "SITE_ID" != 'site_id'
)

select * from renamed
