-- Every order must be paid in full: returns the orders that are not.

select order_id, order_total, total_paid
from {{ ref('fct_orders') }}
where /*status = 'completed'
    and */abs(order_total - coalesce(total_paid, 0)) > 0.01
