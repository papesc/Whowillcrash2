WITH annee AS (
    SELECT
        *, 
        LEFT(CAST(Num_Acc as string), 4) AS an_accident
    FROM {{ref("stg_usagers")}}
),

annee_chiffre AS (
    SELECT
        * except (an_accident),
        CAST(an_accident as INT64) AS an_accident
    FROM annee
),

usagers_age AS (
    SELECT
        *,
        an_accident - an_nais AS age
    FROM annee_chiffre
),

concat_date AS (
    SELECT
        * except(an_accident),
        CONCAT(an_accident, '-', '01', '-', '01') AS an_acc_date
    FROM usagers_age
)

SELECT
    * except(an_acc_date),
    CAST(an_acc_date AS DATE) as annee_acc
FROM concat_date