{% docs stg_orders %}
One row per order. The raw export containes duplicate rows, so we keep
the latest version of each `order_id`.
Status values are trimmed and lower-cased,
so ' Shipped' and 'shipped' become the same value.
{% enddocs %}