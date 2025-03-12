{{ config(materialized = 'table', alias = 'HIERRTLLOCDLMGZ') }}

with source as (
    select * from {{ source('GStestdbt', 'HIERRTLLOCDLMGZ') }}
),

renamed as (
    select
        CAST("STR" as number) as "STR",
        "STR_LABEL",
        CAST("DSTR" as number) as "DSTR",
        "DSTR_LABEL",
        CAST("RGN" as number) as "RGN",
        "RGN_LABEL"
    from source
    where "STR" != 'str'
)

select * from renamed
