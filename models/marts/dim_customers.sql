with orders as (
    select 
        customer_id,
        count(*) as order_count,
        min(order_date) as first_order_at,
        max(order_date) as last_order_at,
        sum(order_total) as lifetime_value
    from {{ ref('fct_orders') }}
    where status != 'returned'
    group by customer_id
)

select
    c.customer_id,
    c.first_name || ' ' || c.last_name as full_name,
    c.email,
    c.city,
    r.country_name,
    r.region,
    coalesce(o.order_count, 0) as order_count,
    o.first_order_at,
    o.last_order_at,
    coalesce(o.lifetime_value, 0) as lifetime_value,
    case
        when coalesce(o.lifetime_value, 0) >= 1000 then 'vip'
        when coalesce(o.lifetime_value, 0) >= 300 then 'regular'
        else 'new'
    end as customer_segment
from {{ ref('stg_customers') }} as c
left join orders as o using (customer_id)
left join {{ ref('country_regions') }} as r using (country)