Welcome to dbt Workshop!

Inspired by: https://www.youtube.com/watch?v=y1nIYW2u28k

# ShopFlow analytics with dbt

## ELT, not ETL
- ETL: transform on a separate server, then load
- ELT: extract + load raw data first, as-is, then transform inside the warehouse with SQL <- dbt

## Layers
- raw: copied from the source, never edited
- staging: one clean model per raw table
- intermediate: joins and reshaping, building blocks
marts: facts and dimensions for the businesss

## ShopFlow raw data
customers, products, orderrs, order_items, payments

## What we will build
1. setup, raw data,projects, profiles, sources, seeds
2. models, ref(), the DAG, materializations
3. Jinja and macros
4. data tests, singlau tests, unit tests
5. docs, snapsthots (SCD2), incremental models, packages
6. selectors, tags, state, dev and prod targets
7. a report-ready mart, Airflow schedule, interview prep

## Who is the for?
- If you know a bit of SQL, then you should be good.

## Install tools
- python
- wsl (for Windows)
- pip install dbt-core==1.12.6 dbt-duckdb==1.11.1



By Joemar