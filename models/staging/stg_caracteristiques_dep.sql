WITH an_string AS (
  SELECT * except(dep),
CAST(dep AS string) AS departements
FROM {{ref("caracteristiques")}}
),

test AS (
SELECT * except(departements),
  CASE
    # transformer les départements à 2 chiffres entre 2005 et 2018 qui finissent par 0
    WHEN LENGTH(departements) = 2 AND RIGHT(departements, 1) = "0" AND an NOT IN (2019, 2020, 2021) THEN SUBSTR(departements, 1, CHAR_LENGTH(departements) - 1) 
    # transformer les départements à 3 chiffres qui finissent par 0
    WHEN LENGTH(departements) = 3 AND RIGHT(departements, 1) = "0" THEN SUBSTR(departements, 1, CHAR_LENGTH(departements) - 1) # sort un 40
    # conserver les départements ronds à 2 chiffres entre 2019 et 2021
    WHEN departements IN ("10", "20", "30", "40", "50", "60", "70", "80", "90") AND an = 2021 OR an = 2020 OR an = 2019 THEN departements # sprt un 40 entre 2019 et 2020
    ELSE departements
  END AS dep
FROM an_string
),

dep_corse AS (SELECT * except(dep),
  CASE 
    WHEN dep IN ("201", "202", "2B", "2A") THEN "20" # transdformer départements de la Corse en 20
    ELSE dep
  END AS dep
FROM test
)

SELECT *,
FROM dep_corse

