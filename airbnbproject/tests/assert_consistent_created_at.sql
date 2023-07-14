SELECT a.listing_id, review_date FROM {{ref('fact_reviews')}} a
LEFT JOIN {{ref('dim_listings_cleansed')}} b
ON a.listing_id=b.listing_id
WHERE a.review_date < b.created_at

