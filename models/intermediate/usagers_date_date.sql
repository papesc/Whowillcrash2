WITH concat_date AS (
    SELECT * except(an_accident),
CONCAT(an_accident, '-', '01', '-', '01') AS an_acc_date
FROM whowillcrash.prod_int.usagers_age_int
)

SELECT * except(an_acc_date),
CAST(an_acc_date AS DATE) as annee_acc
FROM concat_date