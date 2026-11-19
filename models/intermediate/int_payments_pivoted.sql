{% set methods = ['card', 'wallet', ' bank_transfer', 'cash_on_delivery'] %}

select
    order_id,
    {% for m in methods %}
    sum(case when payment_method = '{{ m }}' then amount else 0 end) as {{ m}}_amount,
    {% endfor %}
    sum(amount) as total_paid
from {{ ref('stg_payments') }}
group by order_id
