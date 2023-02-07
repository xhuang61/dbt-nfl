--play by play by player, haha . . . What?! Look elsewhere for naming best practices

with pbp as (
    select * from {{ref('combined_pbp_macro')}}
),

roster as (
    select * from {{ref('stg_roster')}}
)

select 
    pbp.*
    , roster.position
    , roster.depth_chart_position
    , roster.full_name
    , roster.team
from 
    pbp
    left join roster
    on pbp.GSIS_ID = roster.GSIS_ID
    