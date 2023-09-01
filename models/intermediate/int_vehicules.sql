WITH firstloop AS (
SELECT
id_vehicule, Num_Acc, num_veh,
CASE
WHEN motor = 1 THEN "Hydrocarbures"
WHEN motor = 2 THEN "Hybride électrique"
WHEN motor = 3 THEN "Electrique"
WHEN motor = 4 THEN "Hydrogène"
WHEN motor = 5 THEN "Humaine"
ELSE "Autres"
END AS motor,
catv,
CASE
WHEN catv = 7 THEN "Véhicules légers"
WHEN catv = 33 OR catv = 34 OR catv = 43 THEN "2 Roues > 125cm2"
WHEN catv = 2 OR catv = 30 OR catv = 31 OR catv = 32 OR catv = 42 OR catv = 41 THEN "2 Roues < 125cm2"
WHEN catv = 10 THEN "Véhicules utilitaires"
WHEN catv = 80 OR catv = 50 OR catv = 60 OR catv = 1 THEN "Vélos et trotinettes"
ELSE "Autres"
END AS catv_sgt
FROM {{ ref('vehicules') }}
)
SELECT
*,
CASE
WHEN catv_sgt = "Véhicules légers" OR catv_sgt = "Véhicules utilitaires" THEN "Voitures"
WHEN catv_sgt = "2 Roues > 125cm2" OR catv_sgt = "2 Roues < 125cm2" THEN "Deux roues motorisés"
ELSE "Autres"
END AS catv_stats
FROM firstloop
