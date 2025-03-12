{{ config(materialized = 'table', alias = 'HIERHLDYDLMGZ') }}

with source as (
    select * from {{ source('GStestdbt', 'HIERHLDYDLMGZ') }}
),

renamed as (
    select
        "HLDY_ID",
        "HLDY_LABEL"
    from source
    where "HLDY_ID" != 'hldy_id'
)

select * from renamed
