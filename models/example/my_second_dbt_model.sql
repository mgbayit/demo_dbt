{{ config(materialized='table', query_tag='test') }}

with final as (
    select * from {{ ref('my_first_dbt_model') }}
    where id = 1
)

select *, '{{ invocation_id }}' as invocation_id
from final
