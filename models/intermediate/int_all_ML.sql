SELECT
  -- y
  gravite,
  cout_acc_total,

  -- X
  trajet,
  sexe,
  equipement_securite,
--  Ceinture,
--  Casque,
  age,
  motor,
  catv_sgt,
--  catv_stats,
  condition_eclairage,
  departement,
  agglomeration,
  intersection,
  conditions_atmospheriques,
  etat_surface,
  infrastructure,
  vitesse_max_autorisee,
--  usagers_par_acc,
--  vehicules_par_acc,
FROM {{ref("int_all")}}
WHERE cat_usager LIKE "Conducteur"