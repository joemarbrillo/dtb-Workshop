# dbt production checklist

## Structure
- [ ] Every raw table is a source; models use only source() and reg()
- [ ] staging = 1:1 cleaning, intermediate = joins, marts = facts and dims
- [ ] Names: stg_, int_, fct_, dim_ (and mart_ for report tables)

## Quality
- [ ] Every model: primary key tested with unique + not_null
- [ ] accepted_values on status, relationships on foreigh keys
- [ ] Unit tests for tricky logic; contracts on public marts
- [ ] Source freshness with warn_after and error_after

## Operations
- [ ] Production runs dbt build (tests block bad sdata downstream)
- [ ] Snapshots on as chedule; never drop snapshot tables
- [ ] Incremental models: unique_key, late data plan, --full-refresh plan
- [ ] Keep pord manifest.json for slim CI (state:modified+ --defer)
- [ ] Alerts on failure; recover with dbt retry

## People
- [ ] Descriptions on models and key columns; docs published every run
- [ ] Exposures with an owner for every report and dashboard
- [ ] No secrets in git: profiles use env_var()

