{{
    config(
        materialized='view',
        tags=['views_examen']
    )
}}

SELECT 
    t.track_name,
    t.composer
FROM {{ ref('fct_track') }} t
JOIN {{ ref('dim_genre') }} g 
    ON t.genre_id = g.genre_id
WHERE g.genre_name IN ('Rock', 'Jazz')