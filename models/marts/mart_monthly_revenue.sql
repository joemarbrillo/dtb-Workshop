select
    cast(date_trunc('month', o.order_day) as date) as order_month,
    c.region,
    i.category,
    count(distinct o.order_id) as orders,
    cast(sum(i.quantity) as bigint) as units,
    round(sum(i.line_total), 2) as revenue,
    round(sum(i.line_total) / count(distinct o.order_id), 2) as avg_order_value
from {{ ref('fct_orders') }} as o
join {{ ref('fct_order_items')}} as i using (order_id)
join {{ ref('dim_customers') }} as c using (customer_id)
where o.status != 'returned'
group by all
order by order_month, revenue desc
