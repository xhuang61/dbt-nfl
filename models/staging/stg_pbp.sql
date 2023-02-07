{{config(
   materialized = "table" 
)}}

select
    PBP_ID
    , PLAY_ID
    , GAME_ID
    , HOME_TEAM
    , AWAY_TEAM
    , POSTEAM
    , DEFTEAM
    , WEEK
    , GAME_DATE
    , QTR
    , DOWN
    , PLAY_TYPE
from FANTASY_FOOTBALL.NFL2022.PBP
