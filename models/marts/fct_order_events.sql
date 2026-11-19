{{
    config(
        materialized='incremental',
        unique_key='event_id',
        tags=['hourly']
    )
}}

select
    event_id,
    order_id,
    event_type,
    event_at,
    current_timestamp as dbt_loaded_at
from {{ source('raw', 'order_events') }}

{% if is_incremental() %}
where event_at > (select max(event_at) from {{ this }})
{% endif %}