SELECT
  -- y
  gravite,
  cout_acc_total,

  -- X
--  trajet, viré car trop de missing values
  age,
  EXTRACT(YEAR FROM date_date) AS year_acc,
  EXTRACT(MONTH FROM date_date) AS month_acc,
  sexe,
  equipement_securite,
--  Ceinture,
--  Casque,
  motor,
  catv_sgt,
--  catv_stats,
  condition_eclairage,
  departement,
  agglomeration,
  intersection,
  conditions_atmospheriques,
  etat_surface,
--  infrastructure, viré car trop de missing values
--  vitesse_max_autorisee, viré car trop de missing values
--  usagers_par_acc,
--  vehicules_par_acc,
FROM {{ref("int_all")}}
WHERE cat_usager LIKE "Conducteur"