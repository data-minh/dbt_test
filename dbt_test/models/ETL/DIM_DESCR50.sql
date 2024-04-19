{{ config(materialized='table') }}

SELECT
    ROW_NUMBER() OVER () AS id_descr50,
    descr50
FROM {{ source('data_test', 'file1_table') }}
GROUP BY descr50
