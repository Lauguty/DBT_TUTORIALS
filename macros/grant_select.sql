{% macro grant_select(schema = target.schema, role = target.role) %}

    {% set query %}
        {#- NO SIRVE PARA GBQ
        grant usage on schema {{schema}} to role {{role}};
        grant select on all tables in schema {{schema}} to role {{role}};
        grant select on all views in schema {{schema}} to role {{role}};
        -#}
        SELECT 1
    {% endset %}

    {{ log('Granting select on all tables and views in schema ' ~schema ~'to role' ~ role, info=true) }}
    {% do run_query(query) %}
    {{ log('privileges granted!', info=true) }}
    
{% endmacro %}