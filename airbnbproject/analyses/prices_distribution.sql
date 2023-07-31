WITH  dim_listings_with_hosts_cleansed AS
(SELECT PRICE FROM {{ref("dim_listings_with_hosts_cleansed")}})

SELECT  PRICE, COUNT(*) AS count
FROM 
dim_listings_with_hosts_cleansed
GROUP BY PRICE
ORDER BY COUNT DESC