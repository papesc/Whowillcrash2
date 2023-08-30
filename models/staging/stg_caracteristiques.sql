SELECT
dat.num_Acc AS Num_acc,
dat.date_date,
dat.condition_eclairage,
dep.dep,
dat.agglomeration,
dat.intersection,
dat.conditions_atmospheriques
from {{ref('stg_caracteristiques_date')}} as dat
LEFT JOIN {{ref('stg_caracteristiques_dep')}} as dep
ON dat.num_Acc = dep.num_acc