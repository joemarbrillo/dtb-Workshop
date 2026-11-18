select
    product_id,
    product_name,
    category,
    round(price_cents / 100.0, 2) as price
from {{ source('raw', 'products') }}