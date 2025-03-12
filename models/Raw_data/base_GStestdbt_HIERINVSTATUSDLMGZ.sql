{{ config(materialized = 'table', alias = 'HIERINVSTATUSDLMGZ') }}

with source as (
    select * from {{ source('GStestdbt', 'HIERINVSTATUSDLMGZ') }}
),

renamed as (
    select
        "CODE_ID",
        "CODE_LABEL",
        "BCKT_ID",
        "BCKT_LABEL",
        "OWNRSHP_ID",
        "OWNRSHP_LABEL"
    from source
    where "CODE_ID" != 'code_id'
)

select * from renamed
