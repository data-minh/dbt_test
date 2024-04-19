{{ config(materialized='table') }}

select * from {{ source('data_test', 'file1_table') }}