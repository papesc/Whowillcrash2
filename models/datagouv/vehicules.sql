-- Les tables vehicules 2005 à 2018 ont une structure légèrement différente de celles de 2019 à 2021 (notamment pas d'id_vehicule !), d'où la requête suivante :

SELECT
  Num_Acc
  ,NULL AS id_vehicule
  ,num_veh
  ,senc
  ,catv
  ,obs
  ,obsm
  ,choc
  ,manv
  ,NULL AS motor
  ,occutc
FROM `whowillcrash.datagouv.vehicules_2005_2018`
UNION ALL
SELECT
  *
FROM `datagouv.vehicules_2019_2020_2021`