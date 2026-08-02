with cte as
(
    select

        h.host_id,
        h.host_name,
        count(*) as number_of_listings

    from {{ ref("dim_hosts_cleansed") }} h  

    left join {{ ref("dim_listings_cleansed") }} l 
    on h.host_id = l.host_id

    group by 1,2

)
select * from cte
where number_of_listings >= 10