-- select
--     order_id,
--     customer_id,
--     order_date,
--     cast(order_date as date) as order_day,
--     lower(status) as status
-- from {{ source('raw', 'orders') }}

with source as (
    select * from {{ source('raw', 'orders') }}
),
deduped as (
    select *,
        row_number() over(partition by order_id order by updated_at desc) as rn
    from source
)

select
    order_id,
    customer_id,
    order_date,
    cast(order_date as date) as order_day,
    lower(trim(status)) as status,
    updated_at
from deduped
where rn = 1