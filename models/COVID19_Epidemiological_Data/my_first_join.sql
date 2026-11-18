with demographics as (
    select * from {{ ref('covid_demographics') }}
),
codes as (
    select * from {{ ref('country_codes') }}
),
final as (
    select
        d.state,
        c.country_name as name
    from demographics d
    left join codes c
        on d.iso3166_1 = c.country_code
)
select * from final
