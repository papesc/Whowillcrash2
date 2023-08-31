WITH caract AS (
    SELECT
dat.num_Acc AS Num_acc,
dat.date_date,
dat.condition_eclairage,
dep.dep,
dat.agglomeration,
dat.intersection,
dat.conditions_atmospheriques,
FROM {{ref('stg_caracteristiques_date')}} as dat
LEFT JOIN {{ref('stg_caracteristiques_dep')}} as dep
ON dat.num_Acc = dep.num_acc
),

carac_zipcode AS (
SELECT *,
    CASE
        WHEN LENGTH(dep) = 3 THEN CONCAT(dep, '00')
        WHEN LENGTH(dep) = 2 THEN CONCAT(dep, '000')
        WHEN LENGTH(dep) = 1 THEN CONCAT(dep, '0000')
    END AS zipcode,
FROM caract
)

SELECT * except(zipcode),
CAST(zipcode AS INT64) AS zipcode
FROM carac_zipcode