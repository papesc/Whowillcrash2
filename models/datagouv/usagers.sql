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
  ,CASE
    WHEN secu IN (1,11) THEN 1
    WHEN secu IN (2,21) THEN 2
    WHEN secu IN (3,31) THEN 3
    WHEN secu IN (4,41) THEN 4
    WHEN secu IN (9,91) THEN 9
    WHEN secu IN (0,12,22,32,42,92) THEN 0
    WHEN secu IN (13,23,33,43,93) THEN 8
    ELSE -1
   END AS secu1
  ,NULL AS secu2
  ,NULL AS secu3
  ,etatp
FROM whowillcrash.datagouv.usagers_2005_2018
UNION ALL
SELECT
  *
FROM datagouv.usagers_2019_2020_2021