{{ config(materialized='table') }}

with cow_performance as (
    select
        c.cow_id,
        c.breed,
        c.barn_location,
        -- Using average over the historical period in the fact table
        round(avg(f.milk_yield_liters), 2) as avg_daily_yield,
        round(avg(f.feed_intake_kg), 2) as avg_daily_feed,
        -- The core efficiency KPI
        round(avg(f.milk_yield_liters) / nullif(avg(f.feed_intake_kg), 0), 2) as efficiency_ratio
    from {{ ref('fct_daily_yields') }} f
    join {{ ref('dim_cows') }} c on f.cow_id = c.cow_id
    group by 1, 2, 3
)

select *
from cow_performance
order by efficiency_ratio desc