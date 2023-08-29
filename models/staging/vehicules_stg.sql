-- suppression des colonnes inutiles
SELECT COUNT(catv) AS catv FROM {{ source('dbt_papesc_datagouv','vehicules') }}
GROUP BY catv