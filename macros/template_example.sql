{% macro template_example() %}

    {% set query %}
        select true as bool        
    {% endset %}

    {% if execute %}
        {% set results = run_query(query).columns[0].values()[0] %}
        {{ log('SQL resilts ' ~ results, info = true) }}

        select 
            {{ results }} as is_real
        from a_real_table
        
    {% endif %}
    
{% endmacro %}