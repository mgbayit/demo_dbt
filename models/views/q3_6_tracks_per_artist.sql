{{
    config(
        materialized='view',
        tags=['views_examen']
    )
}}

SELECT 
    ar.artist_id,
    ar.artist_name,
    COUNT(t.track_id) AS nb_tracks
FROM {{ ref('dim_artist') }} ar
LEFT JOIN {{ ref('dim_album') }} al 
    ON ar.artist_id = al.artist_id
LEFT JOIN {{ ref('fct_track') }} t 
    ON al.album_id = t.album_id
GROUP BY 
    ar.artist_id,
    ar.artist_name
ORDER BY nb_tracks DESC