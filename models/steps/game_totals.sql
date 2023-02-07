{% set position_types = ['QB','RB', 'TE', 'WR'] %}
{% set play_types = ['RUSHING', 'PASSING', 'RECEIVING'] %}

with pbpbp_transposed as (
    select * from {{ref('pbpbp_transposed')}}
)
select
    GAME_ID
    , HOME_TEAM
    , AWAY_TEAM
    {% for position in position_types -%}
    {% for play in play_types -%}
        , SUM({{position}}_{{play}}_YARDS) AS {{position}}_{{play}}_YARDS  
    {% endfor -%}
    {% endfor %}
from
    pbpbp_transposed
group by 
    GAME_ID
    , HOME_TEAM
    , AWAY_TEAM
