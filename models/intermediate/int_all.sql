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
