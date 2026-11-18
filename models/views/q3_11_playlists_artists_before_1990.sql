{{
    config(
        materialized='view',
        tags=['views_examen']
    )
}}

SELECT DISTINCT
    p.playlist_id,
    p.playlist_name
FROM {{ ref('dim_playlist') }} p
JOIN {{ source('music_source', 'playlist_track') }} pt 
    ON p.playlist_id = pt.playlist_id
JOIN {{ ref('fct_track') }} t 
    ON pt.track_id = t.track_id
JOIN {{ ref('dim_album') }} al 
    ON t.album_id = al.album_id
JOIN {{ ref('dim_artist') }} ar 
    ON al.artist_id = ar.artist_id
WHERE ar.birth_year < 1990