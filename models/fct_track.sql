{{
    config(
        materialized='table',
        tags=['setup_tables']
    )
}}

SELECT 
    t.track_id,
    t.name AS track_name,
    t.album_id,
    t.genre_id,
    t.media_type_id,
    t.composer,
    t.milliseconds,
    t.bytes,
    t.unit_price
FROM {{ source('music_source', 'track') }} t