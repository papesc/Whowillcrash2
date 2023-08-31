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
),

annee_accident AS(
    SELECT
        * except(an_acc_date),
        CAST(an_acc_date AS DATE) as annee_acc
    FROM concat_date
),

cout_grav AS(
    SELECT *,
        CASE 
            WHEN gravite LIKE 'Blessé léger' THEN 17875
            WHEN gravite LIKE 'Blessé hospitalisé ' THEN 446887
            WHEN gravite LIKE 'Tué ' THEN 3575000
            WHEN gravite LIKE 'Indemne' THEN 0
            ELSE NULL
        END AS cout_usager
    FROM annee_accident
),

age_categories AS(
    SELECT
        *,
        CASE 
            WHEN age < 25  THEN '0 à 24 ans'
            WHEN age < 35  THEN '25 à 34 ans'
            WHEN age < 45  THEN '35 à 44 ans'
            WHEN age < 55  THEN '45 à 54 ans'
            WHEN age < 65  THEN '55 à 64 ans'
            WHEN age >= 65  THEN '65 ans et plus'
            ELSE NULL
        END AS age_cat
    FROM cout_grav
)

SELECT
    *,
    SUM(cout_usager) OVER(PARTITION BY Num_Acc) AS cout_acc_total
FROM age_categories
ORDER BY Num_Acc