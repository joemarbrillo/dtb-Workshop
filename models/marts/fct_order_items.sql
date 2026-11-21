select
    {{ dbt_utils.generate_surrogate_key(['order_id', 'order_item_id']) }} as order_item_key,
    order_id,
    product_id,
    product_name,
    category,
    quantity,
    unit_price,
    line_total
from {{ ref('int_order_items_enriched') }}