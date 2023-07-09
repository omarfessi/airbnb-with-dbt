{% snapshot raw_hosts_scd_2 %}
select * from {{ source('airbnb', 'hosts') }}
{% endsnapshot %}
