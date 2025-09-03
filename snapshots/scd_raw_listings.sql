{% snapshot scd_raw_listings %}

{{
    config(
        target_schema = 'dev',
        unique_key = 'id',
        strategy = 'timestamp',
        updated_at ='updated_at',
        invalidate_hard_deletes=true

    )
}}

select * from {{ source('airbnb','listings') }}

{% endsnapshot %}

/*
    target_schema: where to put snapshot
    unique_key: how to identify a row
    strategy:
        Two different strategies, timestamp/check. 
        In timestamp, we use an updated date field to find latest record.
        Then end date any previous records
    updated_at: Last updated date field
    invalidate_hard_deletes: when a record is deleted in the source table, we end date the record in this snapshot
*/