{{
    config(
        materialized='view',
        tags=['views_examen']
    )
}}

SELECT 
    a.album_id,
    a.album_title,
    SUM(t.milliseconds) AS total_duration_ms
FROM {{ ref('fct_track') }} t
JOIN {{ ref('dim_album') }} a 
    ON t.album_id = a.album_id
GROUP BY 
    a.album_id,
    a.album_title
ORDER BY total_duration_ms DESC
LIMIT 10