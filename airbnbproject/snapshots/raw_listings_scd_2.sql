{% snapshot raw_listings_scd_2 %}
    {{
        config(
        target_database='airbnb',
        target_schema='snapshots',
        unique_key='id',
        strategy='timestamp',
        updated_at='updated_at',
        invalidate_hard_deletes=True,
        )
    }}

select * from {{ source('airbnb', 'listings') }}
{% endsnapshot %}
