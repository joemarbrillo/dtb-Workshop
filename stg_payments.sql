select
    payment_id,
    order_id,
    method as payment_method,
    rount(amount_cents / 100.0, 2) as amount, 
    created_at
from {{ source('raw', 'payments') }}