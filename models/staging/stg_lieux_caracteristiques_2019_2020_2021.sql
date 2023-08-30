select
Num_Acc,
jour,
mois,
an,
hrmn,
CASE 
    WHEN lum = 1 THEN "Plein jour"
    WHEN lum = 2 THEN "Crépuscule ou aube"
    WHEN lum = 3 THEN "Nuit sans éclairage public"
    WHEN lum = 4 THEN "Nuit avec éclairage public non allumé"
    WHEN lum = 5 THEN "Nuit avec éclairage public allumé"
    ELSE NULL
END AS condition_eclairage,
dep AS departement,
com AS commune,
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
CASE 
    WHEN col = 1 THEN "Deux véhicules - frontale"
    WHEN col = 2 THEN "Deux véhicules - par l'arrière "
    WHEN col = 3 THEN "Deux véhicules - par le coté "
    WHEN col = 4 THEN "Trois véhicules et plus - en chaîne"
    WHEN col = 5 THEN "Trois véhicules et plus - collisions multiples"
    WHEN col = 6 THEN "Autre collision"
    WHEN col = 7 THEN "Sans collision"
    ELSE NULL
END AS type_collision,
CASE 
    WHEN catr = 1 THEN "Autoroute"
    WHEN catr = 2 THEN "Route nationale"
    WHEN catr = 3 THEN "Route Départementale"
    WHEN catr = 4 THEN "Voie Communales"
    WHEN catr = 5 THEN "Hors réseau public"
    WHEN catr = 6 THEN "Parc de stationnement ouvert à la circulation publique"
    WHEN catr = 7 THEN "Routes de métropole urbaine"
    ELSE NULL
END AS categorie_route,
voie,
V1,
V2,
CASE 
    WHEN circ = 1 THEN "A sens unique"
    WHEN circ = 2 THEN "Bidirectionnelle"
    WHEN circ = 3 THEN "A chaussées séparées"
    WHEN circ = 4 THEN "Avec voies d'affectation variable"
    ELSE NULL
END AS regime_circulation,
nbv AS nbr_voie_circulation,
CASE 
    WHEN vosp = 1 THEN "Piste cyclable"
    WHEN vosp = 2 THEN "Bande cyclable"
    WHEN vosp = 3 THEN "Voie réservée"
    ELSE NULL
END AS voie_reservee,
CASE 
    WHEN prof = 1 THEN "Plat"
    WHEN prof = 2 THEN "Pente"
    WHEN prof = 3 THEN "Sommet de côte"
    WHEN prof = 4 THEN "Bas de côte"
    ELSE NULL
END AS declivite_route,
CASE 
    WHEN plan = 1 THEN "Partie rectiligne"
    WHEN plan = 2 THEN "En courbe à gauche"
    WHEN plan = 3 THEN "En courbe à gauche"
    WHEN plan = 4 THEN "En « S »"
    ELSE NULL
END AS trace_route,
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
CASE 
    WHEN situ = 1 THEN "Sur chaussée"
    WHEN situ = 2 THEN "Sur bande d'arrêt d'urgence"
    WHEN situ = 3 THEN "Sur accotement"
    WHEN situ = 4 THEN "Sur trottoir"
    WHEN situ = 5 THEN "Sur piste cyclable"
    WHEN situ = 6 THEN "Sur autre voie spéciale"
    ELSE NULL
END AS situation_accident, 
vma AS vitesse_max_autorisee
from {{ source('datagouv', 'lieux_caracteristiques_2019_2020_2021') }}