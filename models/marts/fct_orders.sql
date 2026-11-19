with items as (
    select 
        order_id,
        count(*) as item_lines,
        sum(quantity) as units,
        sum(line_total) as order_total
    from {{ ref('int_order_items_enriched') }}
    group by order_id
)

select
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_day,
    o.status,
    i.item_lines,
    i.units,
    i.order_total,
    p.total_paid,
    p.card_amount,
    p.wallet_amount
from {{ ref('stg_orders') }} as o
join items as i using (order_id)
left join {{ ref('int_payments_pivoted') }} as p using (order_id)