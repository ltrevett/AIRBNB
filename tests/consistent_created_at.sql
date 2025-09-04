select
    *
from {{ref("fct_reviews")}} f 

inner join {{ref("dim_listings_cleansed")}} l 
on l.listing_id = f.listing_id

where l.created_at > f.review_date

limit 10