{{config(
   materialized = "table" 
)}}

select
    PBP_ID
    , GSIS_ID
    , YARDS_GAINED
from FANTASY_FOOTBALL.NFL2022.PBP_RECEIVING
