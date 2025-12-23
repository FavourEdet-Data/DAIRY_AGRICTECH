{{ config(materialized='table') }}

with cows as (
    select * from {{ source('dairy_source', 'animals_seed') }}
)

select
    cow_id,
    breed,
    barn_location,
    status
from cows