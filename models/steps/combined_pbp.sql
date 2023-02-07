{% set test = 'pbp'%}

with pbp as (
        select * from {{ref('stg_pbp')}}
    ),
    
    rushing as (
        select * from {{ref('stg_pbp_rushing')}}
    ),

    passing as (
        select * from {{ref('stg_pbp_passing')}}
    ),

    receiving as (
        select * from {{ref('stg_pbp_receiving')}}
    )
select 
    pbp.*
    , rushing.yards_gained as rushing_yards
    , passing.yards_gained as passing_yards
    , receiving.yards_gained as receiving_yards
 from pbp
    left join rushing on pbp.pbp_id = rushing.pbp_id
    left join passing on pbp.pbp_id = passing.pbp_id
    left join receiving on pbp.pbp_id = receiving.pbp_id