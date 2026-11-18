{{
    config(
        materialized='view',
        tags=['views_examen']
    )
}}

SELECT 
    g.genre_id,
    g.genre_name,
    AVG(t.bytes) AS avg_track_size_bytes
FROM {{ ref('fct_track') }} t
JOIN {{ ref('dim_genre') }} g 
    ON t.genre_id = g.genre_id
GROUP BY 
    g.genre_id,
    g.genre_name
ORDER BY avg_track_size_bytes DESC