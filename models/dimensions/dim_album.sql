{{
    config(
        materialized='table',
        tags=['setup_tables']
    )
}}

SELECT 
    album_id,
    title AS album_title,
    artist_id,
    production_year,
    cd_number
FROM {{ source('music_source', 'album') }}