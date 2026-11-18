{{
    config(
        materialized='table',
        tags=['setup_tables']
    )
}}

SELECT 
    genre_id,
    name AS genre_name
FROM {{ source('music_source', 'genre') }}