SELECT 
  num_acc,
  date(an, mois, jour) as date_date,
  dep,
  agg,
  int,
  atm, 
  lum
FROM `dbt_sbekkal_datagouv.caracteristiques`
