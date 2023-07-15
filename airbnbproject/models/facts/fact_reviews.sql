{{
  config(
    materialized = 'incremental',
    on_schema_change = 'fail'
    )
}}
WITH src_reviews as (SELECT * FROM {{ref('src_reviews')}})
SELECT {{ dbt_utils.generate_surrogate_key(['LISTING_ID', 'REVIEW_DATE', 'REVIEWER_NAME', 'REVIEW_TEXT']) }} as review_id, 
* FROM src_reviews
where review_text is not null
{% if is_incremental() %}
  and review_date >= (select max(review_date) from {{ this }})
{% endif %}
