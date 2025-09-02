{{
    config(
        materialized = 'table'
    )
}}

with cte as
(
    select
        
        r.*,
        case when d.full_moon_date is not null then 'full moon'
        else 'not full moon' end as is_full_moon
    
    from {{ref("fct_reviews")}} r 

    left join {{ref("seed_full_moon_dates")}} d 
    on r.review_date::date = dateadd(day, 1, d.full_moon_date)
    -- review date one day on from full moon so we look at reviews for full moon the night before
)

select * from cte