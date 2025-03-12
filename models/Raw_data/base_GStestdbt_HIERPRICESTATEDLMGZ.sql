{{ config(materialized = 'table', alias = 'HIERPRICESTATEDLMGZ') }}

with source as (
    select * from {{ source('GStestdbt', 'HIERPRICESTATEDLMGZ') }}
),

renamed as (
    select
        "SUBSTATE_ID",
        "SUBSTATE_LABEL",
        "STATE_ID",
        "STATE_LABEL"
    from source
    where "SUBSTATE_ID" != 'substate_id'
)

select * from renamed
