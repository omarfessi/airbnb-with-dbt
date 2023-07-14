SELECT minimum_nights FROM {{ref('dim_listings_cleansed')}}
WHERE minimum_nights < 0 
LIMIT 1