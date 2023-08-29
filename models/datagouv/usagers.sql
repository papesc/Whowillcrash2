-- Model pour créer la table usagers complète de 2005 à 2021
-- Les tables usagers 2005 à 2018 ont une structure légèrement différente de celles de 2019 à 2021 (notamment pas d'id_vehicule !), d'où la requête suivante :

SELECT
  Num_Acc
  ,NULL as id_vehicule
  ,num_veh
  ,catu
  ,grav
  ,sexe
  ,an_nais
  ,trajet
  ,secu AS secu1
  ,NULL AS secu2
  ,NULL AS secu3
  ,etatp
FROM whowillcrash.datagouv.usagers_2005_2018
UNION ALL
SELECT
  *
FROM datagouv.usagers_2019_2020_2021
