{% macro to_gallons(column_name) %}
    round(({{ column_name }} * 0.264172), 2)
{% endmacro %}