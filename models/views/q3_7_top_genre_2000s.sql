{{
    config(
        materialized='view',
        tags=['views_examen']
    )
}}

SELECT 
    g.genre_id,
    g.genre_name,
    COUNT(t.track_id) AS nb_tracks
FROM {{ ref('fct_track') }} t
JOIN {{ ref('dim_genre') }} g 
    ON t.genre_id = g.genre_id
JOIN {{ ref('dim_album') }} a 
    ON t.album_id = a.album_id
WHERE a.production_year BETWEEN 2000 AND 2009
GROUP BY 
    g.genre_id,
    g.genre_name
ORDER BY nb_tracks DESC
LIMIT 1