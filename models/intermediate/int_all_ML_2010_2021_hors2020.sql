{{config(
    materialized = 'table'
)}}


SELECT
    *
FROM {{ref('int_all_ML')}}
WHERE year_acc BETWEEN 2010 AND 2019 OR year_acc = 2021