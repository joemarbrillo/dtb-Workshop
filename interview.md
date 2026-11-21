# dbt interview questions

1. What is dbt? The T in ELT: SQL select models, built in the warehouse.
    It does not extract or load data, and it does not schedule itself.

2. ref() vs source(): ref points to another dbt model or seed, 
    source pints to a raw table that dbt did not create. Both build the DAG.

3. Materializations: view (cheap, always refresh), table (fast reads),
    ephemeral (inline CTE), incremental (only new rows)

4. Incremental: is_incremental() filter new rows, {{ this }} is the existing
    table, unique_key avoid duplicates, --full-refresh rebuilds it.

5. Tests: generic (unique, not_null, accepted_values, relationships),
    singular SQL files, custom generic tets, and unit tests on fake rows.

6. Snapshot: SCD type 2 history. timestamp or check strategy,
    dbt_value_from / dbt_valid_to. Snapshot raw data, never drop the table.

7. run vs test vs build:
    run builds models
    test runs tests
    build does seeds, models, snapshots and tests in DAG order, and skips children of failures.

8. Slim CI: keep the prod manifest.json, then
    dbt build --select state:modified+ --defer --state prod_state

9. Macro: reusable jinja, like cents_to_dollars or generate_schema_name.
    Packages such as dbt_utils are collections of macros and tests.

10. Layers: sources, staging (1:1 cleaning), intermediate(joins),
    marts(facts and dimenstions). Tests and docs in YAML next to models.

11. Contract: columns + data types in YAML, contract enforced: true.
    Checked before the build; tests check values after it.

12. Hooks: pre-hook / post-hook per model, on-run-start / on-run-end per run.
    dbt retry rereuns only failed and skipped nodes from the last run.

Bonus: dbt v2 is newer engine written in Rust. Same project format;
    dbt Core v1 (used here) is open source and still supported.