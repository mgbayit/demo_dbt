{{
    config(
        materialized='table',
        tags=['setup_tables']
    )
}}

SELECT 
    artist_id,
    name AS artist_name,
    CAST(birth_year AS INT) AS birth_year,
    country
FROM {{ source('music_source', 'artist') }}