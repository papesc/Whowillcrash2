/*SELECT
    catv,
    COUNT(catv) AS catv_count,
FROM {{ ref('vehicules') }}
GROUP BY catv 
ORDER BY catv_count DESC*/

SELECT * FROM {{ ref('vehicules') }}