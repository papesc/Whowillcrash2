SELECT
    usagers.Num_Acc AS num_acc,
    annee_acc,
    cat_usager,
    sexe,
    an_nais AS annee_naissance,
    age,
    gravite,
    usagers.id_vehicule,
    trajet,
    usagers.num_veh AS num_vehicule,
    catv AS cat_vehicule,
    catv_sgt AS cat_vehicule_sgt,
    motor,
    equipement_securite
FROM {{ ref('int_usagers') }} AS usagers
INNER JOIN {{ ref('int_vehicules') }} AS vehicules ON usagers.Num_Acc = vehicules.Num_Acc