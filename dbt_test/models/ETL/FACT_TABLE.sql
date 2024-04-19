{{ config(materialized='table') }}

SELECT
    id,
    id_job_title,
    id_descr50,
    job_level,
    job_grp,
    vert_grp,
    notes,
    del_doc_path,
    del_doc_name,
    beroep_cd,
    code_fnc,
    schaalsrt,
    schaalcode,
    kmrateint,
    productiv,
    prodpct,
    xdefratelv,
    inttar,
    exttar,
    timestamp,
    docid,
    roleid,
    rolelevel,
    scalemin,
    scalemax,
    wkcp_risk,
    division,
    syscreator,
    id_sys
FROM {{ source('data_test', 'file1_table') }} s
LEFT JOIN {{ source('data_test', 'DIM_JOB_TITLE') }} d1 ON s.job_title = d1.job_title
LEFT JOIN {{ source('data_test', 'DIM_DESCR50') }} d2 ON s.descr50 = d2.descr50
LEFT JOIN {{ source('data_test', 'DIM_SYS') }} d3 ON s.syscreated = d3.syscreated and s.sysmodified = d3.sysmodified and s.sysguid = d3.sysguid
