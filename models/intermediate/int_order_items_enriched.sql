select
    i.order_item_id,
    i.order_id,
    i.product_id,
    p.product_name,
    p.category,
    i.quantity,
    i.unit_price,
    i.quantity * i.unit_price as line_total
from {{ ref('stg_order_items') }} as i
join {{ ref('stg_products') }} as p using (product_id)