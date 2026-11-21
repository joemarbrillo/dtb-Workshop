-- Ad hoc question: who are our five most valueble customers
select customer_id, full_name, region, order_count, 
    round(lifetime_value, 2) as lifetime_value
from {{ ref('dim_customers') }}
order by lifetime_value desc