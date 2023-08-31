-- Les valeurs tutélaires de l’insécurité routière évoluent selon le PIB par habitant 
-- et sont actualisées chaque année
-- Chiffres pour 2021

SELECT *,
    CASE 
        WHEN gravite = 'Blessé léger' AND annee_acc = '2021-01-01' THEN 17875 
        WHEN gravite = 'Blessé hospitalisé' AND annee_acc = '2021-01-01' THEN 446887
        WHEN gravite = 'Tué' AND annee_acc = '2021-01-01' THEN 3575000
        WHEN gravite = 'Indemne' AND annee_acc = '2021-01-01' THEN 0
        ELSE NULL
    END AS cout_acc
FROM {{ref('int_usagers')}}