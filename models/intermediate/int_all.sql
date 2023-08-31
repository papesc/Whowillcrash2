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