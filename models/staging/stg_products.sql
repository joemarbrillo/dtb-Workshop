select
    product_id,
    product_name,
    category,
    -- round(price_cents / 100.0, 2) as price
    {{ cents_to_dollars('price_cents') }} as price
from {{ source('raw', 'products') }}