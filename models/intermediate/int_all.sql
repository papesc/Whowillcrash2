<<<<<<< HEAD
/*WITH firstloop AS(*/
SELECT
usagers.Num_acc AS num_acc,
usagers.num_veh AS num_veh,
COALESCE(usagers.id_vehicule, '0') AS id_vehicule,
catv,
catv_sgt,
cat_usager,
sexe,
age,
an_nais,
gravite,
trajet,
equipement_securite
FROM {{ ref('int_usagers') }} AS usagers
INNER JOIN {{ ref('int_vehicules') }} AS vehicules ON usagers.Num_Acc = vehicules.Num_Acc
/*)
SELECT
firstloop.num_acc,
CONCAT(firstloop.num_veh,"_",firstloop.Num_acc) AS id_vehicule,
carac_lieux.date_date AS date_acc,
firstloop.catv AS cat_vehicules,
firstloop.catv_sgt AS cat_vehicules_sgt,
firstloop.cat_usager,
firstloop.sexe,
firstloop.age,
firstloop.an_nais AS annee_naissance,
firstloop.gravite,
carac_lieux.departement,
carac_lieux.agglomeration,
carac_lieux.intersection,
carac_lieux.conditions_atmospheriques,
carac_lieux.etat_surface,
carac_lieux.infrastructure,
carac_lieux.vitesse_max_autorisee,
firstloop.trajet,
firstloop.equipement_securite
FROM firstloop
INNER JOIN {{ ref('int_caracteristiques_lieux') }} AS carac_lieux ON firstloop.Num_Acc = carac_lieux.Num_Acc*/

/*SELECT * FROM {{ ref('int_usagers') }}*/
=======
--- Table joined où chaque ligne est un usager, avec son véhicule (joined sur id_vehicule_NEW, qui est la concat de num_veh et Num_Acc) et les caractéristiques de son accident (joined sur Num_Acc)
WITH id_veh AS(
  SELECT
    * EXCEPT(id_vehicule),
    CONCAT(num_veh,'_',Num_Acc) AS id_vehicule_NEW
  FROM {{ref('int_usagers')}}
)

SELECT
  u.*,
  v.* EXCEPT(id_vehicule_NEW, Num_Acc, num_veh),
  c.* EXCEPT(Num_Acc)
FROM id_veh u
INNER JOIN {{ref('int_vehicules')}} v
  USING(id_vehicule_NEW)
LEFT JOIN {{ref('int_caracteristiques_lieux')}} c
  ON u.Num_Acc = c.Num_acc
>>>>>>> af798e2984ee861ca47903b7ffe54a4fa62d8570
