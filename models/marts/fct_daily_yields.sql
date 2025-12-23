{{ config(materialized='incremental', unique_key='production_id') }}

with production as (
    select * from {{ ref('stg_daily_production') }}
    {% if is_incremental() %}
      where production_date > (select max(production_date) from {{ this }})
    {% endif %}
),

cows as (
    select * from {{ ref('dim_cows') }}
)

select
    -- Professional hashing for your 1,000 cow records
    {{ dbt_utils.generate_surrogate_key(['p.cow_id', 'p.production_date']) }} as production_id,
    p.production_date,
    p.cow_id,
    c.breed,
    c.barn_location,
    p.milk_yield_liters,
    -- Applying your custom unit conversion macro
    {{ to_gallons('p.milk_yield_liters') }} as milk_yield_gallons,
    p.feed_intake_kg,
    round(p.milk_yield_liters / nullif(p.feed_intake_kg, 0), 2) as feed_efficiency
from production p
left join cows c on p.cow_id = c.cow_id