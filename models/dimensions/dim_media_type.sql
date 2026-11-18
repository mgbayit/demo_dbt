{{
    config(
        materialized='table',
        tags=['setup_tables']
    )
}}

SELECT 
    media_type_id,
    name AS media_type_name
FROM {{ source('music_source', 'media_type') }}