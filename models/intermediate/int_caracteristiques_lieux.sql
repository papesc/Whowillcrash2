SELECT
carac.Num_acc,
date_date,
condition_eclairage,
dep AS departement,
agglomeration,
intersection,
conditions_atmospheriques,
etat_surface,
infrastructure,
vitesse_max_autorisee
from {{ref('stg_caracteristiques')}} as carac
LEFT JOIN {{ref('stg_lieux')}} as lieux
ON carac.Num_acc = lieux.Num_acc