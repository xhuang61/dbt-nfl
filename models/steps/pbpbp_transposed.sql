{% set position_types = ['QB','RB', 'TE', 'WR'] %}
{% set play_types = ['RUSHING', 'PASSING', 'RECEIVING'] %}

with pbpbp as (
    select * from {{ref('pbpbp')}}
)
select
    GAME_ID
    , PBP_ID
    , QTR
    , HOME_TEAM
    , AWAY_TEAM
    {% for position in position_types -%}
    {% for play in play_types -%}
        , case when POSITION = '{{position}}' then {{play}}_YARDS else 0 end as {{position}}_{{play}}_YARDS
    {% endfor -%}
    {% endfor -%}
from
    pbpbp
    