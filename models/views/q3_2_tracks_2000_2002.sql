{{
    config(
        materialized='view',
        tags=['views_examen']
    )
}}

SELECT 
    t.track_id,
    t.track_name,
    a.album_title,
    a.production_year
FROM {{ ref('fct_track') }} t
JOIN {{ ref('dim_album') }} a 
    ON t.album_id = a.album_id
WHERE a.production_year IN (2000, 2002)