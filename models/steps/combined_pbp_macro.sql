{% set play_types = ['rushing', 'passing', 'receiving'] %}

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
    {% for play in play_types -%}
    , case when {{play}}.yards_gained is null then 0 else {{play}}.yards_gained end as {{play}}_yards
    {% endfor -%}
    , nvl(rushing.GSIS_ID, nvl(passing.GSIS_ID, receiving.GSIS_ID)) as GSIS_ID
 from pbp
    {% for play in play_types -%}
    left join {{play}} on pbp.pbp_id = {{play}}.pbp_id
    {% endfor %}
