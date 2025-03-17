{{   config(
    materialized='incremental',
    unique_key=['pos_site_id', 'sku_id', 'fsclwk_id', 'price_substate_id', 'type']
  ) }}

WITH incremental_records AS (
    SELECT MAX(dt) AS date_record
    FROM {{ ref('base_GStestdbt_FACTTRANSACTIONSDLMGZ') }}
),

transactions AS (
    SELECT
        t.pos_site_id,
        t.sku_id,
        c.fsclwk_id,
        t.price_substate_id,
        t.type,
        SUM(t.sales_units) AS total_sales_units,
        SUM(t.sales_dollars) AS total_sales_dollars,
        SUM(t.discount_dollars) AS total_discount_dollars
    FROM {{ ref('base_GStestdbt_FACTTRANSACTIONSDLMGZ') }} AS t
    LEFT JOIN {{ ref('base_GStestdbt_HIERCLNDDLMGZ') }} AS c 
    ON t.fscldt_id = c.fscldt_id
    {% if is_incremental() %}
    WHERE t.dt > (SELECT date_record FROM incremental_records)
    {% endif %}
    GROUP BY t.pos_site_id, t.sku_id, c.fsclwk_id, t.price_substate_id, t.type
)

SELECT * FROM transactions
