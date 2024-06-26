{{ config(materialized='table') }}

SELECT
    ROW_NUMBER() OVER () AS id_job_title,
    job_title
FROM {{ source('data_test', 'file1_table') }}
GROUP BY job_title
