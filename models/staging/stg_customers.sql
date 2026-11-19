select
    customer_id,
    first_name,
    last_name,
    lower(email) as email,
    city,
    country,
    signup_date,
    tier,
    updated_at
from {{ source('raw', 'customers') }}
