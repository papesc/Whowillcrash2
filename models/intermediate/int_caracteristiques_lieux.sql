WITH lieux_car AS(
    SELECT
        carac.Num_acc,
        date_date,
        condition_eclairage,
        dep AS departement,
        agglomeration,
        intersection,
        conditions_atmospheriques,
        etat_surface,
        infrastructure,
        vitesse_max_autorisee
    FROM {{ref('stg_caracteristiques')}} as carac
    LEFT JOIN {{ref('stg_lieux')}} as lieux
        ON carac.Num_acc = lieux.Num_acc
),

usagers_par_accident AS(
  SELECT
    Num_Acc,
    COUNT(Num_Acc) AS usagers_par_acc
  FROM lieux_car
  GROUP BY Num_Acc
  ORDER BY usagers_par_acc DESC
),

vehicules_par_accident AS(
  SELECT
    Num_Acc,
    COUNT(Num_Acc) AS vehicules_par_acc
  FROM `whowillcrash.prod_int.int_vehicules`
  GROUP BY Num_Acc
  ORDER BY vehicules_par_acc DESC
)

SELECT
  c.*,
  u.usagers_par_acc,
  v.vehicules_par_acc
FROM `dbt_fredodof_int.int_caracteristiques_lieux` c
LEFT JOIN usagers_par_accident u
  USING(Num_Acc)
LEFT JOIN vehicules_par_accident v
  USING(Num_Acc)