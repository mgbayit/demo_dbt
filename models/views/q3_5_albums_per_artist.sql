{{
    config(
        materialized='view',
        tags=['views_examen']
    )
}}

SELECT 
    ar.artist_id,
    ar.artist_name,
    COUNT(al.album_id) AS nb_albums
FROM {{ ref('dim_artist') }} ar
LEFT JOIN {{ ref('dim_album') }} al 
    ON ar.artist_id = al.artist_id
GROUP BY 
    ar.artist_id,
    ar.artist_name
ORDER BY nb_albums DESC