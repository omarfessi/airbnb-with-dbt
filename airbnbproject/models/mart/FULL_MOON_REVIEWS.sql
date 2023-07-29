{{ config(materialized = 'table') }}

WITH fact_reviews AS 
(SELECT * FROM {{ref("fact_reviews")}}),

full_moon_dates AS 
(SELECT * FROM {{ref("seed_full_moon_dates")}})

SELECT fact_reviews.*, 
CASE 
    WHEN full_moon_dates.full_moon_date IS NULL THEN 'not full moon'
    ELSE 'full moon'
END AS is_full_moon

from fact_reviews 

LEFT JOIN full_moon_dates 
ON (TO_DATE(fact_reviews.review_date) = DATEADD(DAY, 1, full_moon_dates.full_moon_date))


