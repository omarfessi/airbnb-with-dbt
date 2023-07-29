WITH  full_moon_dates_reviews AS
(SELECT is_full_moon, review_sentiment FROM {{ref("FULL_MOON_REVIEWS")}})

SELECT is_full_moon, review_sentiment, count(*) as count 
FROM full_moon_dates_reviews
GROUP BY is_full_moon, review_sentiment
ORDER BY is_full_moon, review_sentiment