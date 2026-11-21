def model(dbt, session):
    dbt.config(materialized="table")
    orders = dbt.ref("fct_orders")
    return orders.aggregate(
        "status, count(*) as orders, round(sum(order_total), 2) as revenue",
        "status",
    ).order("revenue desc")

