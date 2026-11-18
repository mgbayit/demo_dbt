{{
    config(
        materialized='view',
        tags=['views_examen']
    )
}}

SELECT 
    album_title
FROM {{ ref('dim_album') }}
WHERE cd_number > 1