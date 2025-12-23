with raw_data as (
    select * from {{ source('dairy_source', 'daily_production') }}
)
select
    cow_id,
    cast(milk_yield as decimal(10,2)) as milk_yield_liters,
    cast(feed_intake as decimal(10,2)) as feed_intake_kg,
    cast(obs_at as date) as production_date
from raw_data 