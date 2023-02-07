{{config(
   materialized = "table" 
)}}

SELECT
    GSIS_ID
    , FULL_NAME
    , FIRST_NAME
    , LAST_NAME
    , POSITION
    , TEAM
    , DEPTH_CHART_POSITION
    , JERSEY_NUMBER
    , YEARS_EXP
    , BIRTH_DATE
    , COLLEGE
    , STATUS
FROM FANTASY_FOOTBALL.NFL2022.ROSTER