
{% macro no_nulls_in_columns(model_name) %}
    SELECT * FROM {{model_name}}
    WHERE
    {% for col in adapter.get_columns_in_relation(model_name) -%}
        {{col.column}} IS NULL OR
    {% endfor -%}
    FALSE
{% endmacro %}
