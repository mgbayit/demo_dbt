{{
    config(
        materialized='view',
        tags=['views_examen']
    )
}}

SELECT DISTINCT
    p.playlist_name
FROM {{ ref('dim_playlist') }} p
JOIN {{ source('music_source', 'playlist_track') }} pt 
    ON p.playlist_id = pt.playlist_id
JOIN {{ ref('fct_track') }} t 
    ON pt.track_id = t.track_id
WHERE t.milliseconds > 240000