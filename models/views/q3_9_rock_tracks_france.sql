{{
    config(
        materialized='view',
        tags=['views_examen']
    )
}}

SELECT 
    t.track_id,
    t.track_name,
    ar.artist_name,
    ar.country,
    g.genre_name
FROM {{ ref('fct_track') }} t
JOIN {{ ref('dim_genre') }} g 
    ON t.genre_id = g.genre_id
JOIN {{ ref('dim_album') }} al 
    ON t.album_id = al.album_id
JOIN {{ ref('dim_artist') }} ar 
    ON al.artist_id = ar.artist_id
WHERE g.genre_name = 'Rock'
  AND ar.country = 'France'