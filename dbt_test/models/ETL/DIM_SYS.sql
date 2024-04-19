{{ config(materialized='table') }}

SELECT
    ROW_NUMBER() OVER () AS id_sys,
    syscreated,
    sysmodified,
    sysguid
FROM {{ source('data_test', 'file1_table') }}
GROUP BY syscreated, sysmodified, sysguid