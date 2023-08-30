select
num_Acc,
date_date,
CASE 
    WHEN lum = 1 THEN "Plein jour"
    WHEN lum = 2 THEN "Crépuscule ou aube"
    WHEN lum = 3 THEN "Nuit sans éclairage public"
    WHEN lum = 4 THEN "Nuit avec éclairage public non allumé"
    WHEN lum = 5 THEN "Nuit avec éclairage public allumé"
    ELSE NULL
END AS condition_eclairage,
dep AS departement,
CASE 
    WHEN agg = 1 THEN "Hors agglomération"
    WHEN agg = 2 THEN "En agglomération"
    ELSE NULL
END AS agglomeration,
CASE 
    WHEN int = 1 THEN "Hors intersection"
    WHEN int = 2 THEN "Intersection en X"
    WHEN int = 3 THEN "Intersection en T"
    WHEN int = 4 THEN "Intersection en Y"
    WHEN int = 5 THEN "Intersection à plus de 4 branches"
    WHEN int = 6 THEN "Giratoire"
    WHEN int = 7 THEN "Place"
    WHEN int = 8 THEN "Passage à niveau"
    WHEN int = 9 THEN "Autre intersection"
    ELSE NULL
END AS intersection,
CASE 
    WHEN atm = 1 THEN "Normale"
    WHEN atm = 2 THEN "Pluie légère"
    WHEN atm = 3 THEN "Pluie forte"
    WHEN atm = 4 THEN "Neige - grêle"
    WHEN atm = 5 THEN "Brouillard - fumée"
    WHEN atm = 6 THEN "Vent fort - tempête"
    WHEN atm = 7 THEN "Temps éblouissant"
    WHEN atm = 8 THEN "Temps couvert"
    ELSE NULL
END AS conditions_atmospheriques,
from {{ source('dbt_sbekkal_stg', 'creation_colonne_date_caracteristiques') }}