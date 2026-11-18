{{
    config(
        materialized='table',
        tags=['setup_tables']
    )
}}

SELECT 
    playlist_id,
    name AS playlist_name
FROM {{ source('music_source', 'playlist') }}