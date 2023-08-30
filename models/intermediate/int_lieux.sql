select
Num_Acc,
CASE 
    WHEN surf = 1 THEN "Normale"
    WHEN surf = 2 THEN "Moullée"
    WHEN surf = 3 THEN "Flaques"
    WHEN surf = 4 THEN "Innondée"
    WHEN surf = 5 THEN "Enneigée"
    WHEN surf = 6 THEN "Boue"
    WHEN surf = 7 THEN "Verglacée"
    WHEN surf = 8 THEN "Corps gras - huile"
    ELSE NULL
END AS etat_surface,
CASE 
    WHEN infra = 1 THEN "Souterrain - tunnel"
    WHEN infra = 2 THEN "Pont - autopont"
    WHEN infra = 3 THEN "Bretelle d'échangeur ou de raccordement"
    WHEN infra = 4 THEN "Voie ferrée"
    WHEN infra = 5 THEN "Carrefour aménagé"
    WHEN infra = 6 THEN "Zone piétonne"
    WHEN infra = 7 THEN "Zone de péage"
    WHEN infra = 8 THEN "Chantier"
    ELSE NULL
END AS infrastructure,
vma AS vitesse_max_autorisee
from {{ source('dbt_sbekkal_datagouv', 'lieux') }}