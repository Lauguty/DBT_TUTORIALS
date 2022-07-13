{% macro limit_data_in_dev(column_name, dev_days_of_data =3) -%}
    {% if target.name == 'dev' %} {#- This is defined in the "TARGET NAME" of the project credentials -#}
        where {{column_name}} >= date_add(current_date(), INTERVAL -{{ dev_days_of_data }} day)
    {% endif %}    
{%- endmacro %}