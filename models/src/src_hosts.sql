with raw_hosts as
(
    select

        id as host_id,
        name as host_name,
        is_superhost,
        created_at,
        updated_at

    from AIRBNB.RAW.RAW_HOSTS
)

select * from raw_hosts