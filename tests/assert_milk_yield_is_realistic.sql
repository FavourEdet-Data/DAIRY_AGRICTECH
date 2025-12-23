-- This test fails if any cow produces more than 60 liters in a day
-- In a real Danish farm, 60L is a very high but possible limit for top Holsteins
select
    production_id,
    milk_yield_liters
from {{ ref('fct_daily_yields') }}
where milk_yield_liters > 60