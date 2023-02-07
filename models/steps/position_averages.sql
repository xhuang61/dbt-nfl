{% set position_types = ['QB','RB', 'TE', 'WR'] %}
{% set play_types = ['RUSHING', 'PASSING', 'RECEIVING'] %}

with game_totals as (
    select * from {{ref('game_totals')}}
)
select
    'AVERAGE' AS CALC_TYPE
    {% for position in position_types -%}
    {% for play in play_types -%}
        , AVG({{position}}_{{play}}_YARDS) AS AVG_{{position}}_{{play}}_YARDS  
    {% endfor -%}
    {% endfor %}
from
    game_totals