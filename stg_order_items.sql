select
    order_item_id,
    order_id,
    product_id,
    quantity,
    round(unit_price_cents / 100.0, 2) as unit_price
from {{ source('raw', 'order_items') }}