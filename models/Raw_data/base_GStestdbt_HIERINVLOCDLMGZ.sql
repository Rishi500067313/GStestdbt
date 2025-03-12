{{ config(materialized = 'table', alias = 'HIERINVLOCDLMGZ') }}

with source as (
    select * from {{ source('GStestdbt', 'HIERINVLOCDLMGZ') }}
),

renamed as (
    select
        CAST("LOC" as number) as "LOC",
        "LOC_LABEL",
        "LOCTYPE",
        "LOCTYPE_LABEL"
    from source
    where "LOC" != 'loc'
)

select * from renamed
