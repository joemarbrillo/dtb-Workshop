select
    payment_id,
    order_id,
    method as payment_method,
    -- round(amount_cents / 100.0, 2) as amount, 
    {{ cents_to_dollars('amount_cents') }} as amount,
    created_at
from {{ source('raw', 'payments') }}