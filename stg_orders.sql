select
    order_id,
    customer_id,
    order_date,
    cast(order_date as date) as order_day,
    lower(status) as status
from {{ source('raw', 'orders') }}