{% macro row_counts(schema_name='marts') %}
    {% set query%}
        select table_name from information_schema.tables
        where table_name = '{{ schema_name }}' order by table_name
    {% endset %}
    {% set tables = run_query(query).columns[0].values() %}
    {% for t in tables %}
        {% set n = run_query('select count(*) from ' ~ schema_name ~ '.' ~ t).columns[0].values()[0] %}
        {{ log(schema_name ~ '.' ~ ': ' ~ n ~ ' rows', info=true) }}
    {% endfor %}
{% endmacro %}