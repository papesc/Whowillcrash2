WITH annee AS (
  SELECT *, 
 LEFT(CAST(Num_Acc as string), 4) AS an_accident
FROM {{ref("stg_usagers")}}
),

annee_chiffre AS (
SELECT * except (an_accident),
  CAST(an_accident as INT64) AS an_accident
FROM annee
)

SELECT *,
  an_accident - an_nais AS age
FROM annee_chiffre