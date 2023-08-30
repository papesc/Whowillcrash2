WITH agg_2005_2018 AS(
  SELECT *
  FROM `datagouv.lieux_2005`
  UNION ALL 
  SELECT *
  FROM `datagouv.lieux_2006`
  UNION ALL
  SELECT *
  FROM `datagouv.lieux_2007`
  UNION ALL 
  SELECT *
  FROM `datagouv.lieux_2008`
  UNION ALL 
  SELECT *
  FROM `datagouv.lieux_2009`
  UNION ALL 
  SELECT *
  FROM `datagouv.lieux_2010`
  UNION ALL 
  SELECT *
  FROM `datagouv.lieux_2011`
  UNION ALL 
  SELECT *
  FROM `datagouv.lieux_2012`
  UNION ALL 
  SELECT *
  FROM `datagouv.lieux_2013`
  UNION ALL 
  SELECT *
  FROM `datagouv.lieux_2014`
  UNION ALL 
  SELECT *
  FROM `datagouv.lieux_2015`
  UNION ALL 
  SELECT *
  FROM `datagouv.lieux_2016`
  UNION ALL 
  SELECT *
  FROM `datagouv.lieux_2017`
  UNION ALL 
  SELECT *
  FROM `datagouv.lieux_2018`
),
lieux_2019_2021 AS(
SELECT *
FROM `datagouv.lieux_2019`
UNION ALL 
SELECT *
FROM `datagouv.lieux_2020`
UNION ALL 
SELECT *
FROM `datagouv.lieux_2021`
),
clean_2005_2018 AS(
  SELECT 
    Num_Acc,
    surf,
    infra,
    CAST(vma as INT64) AS vma
  FROM agg_2005_2018
)
SELECT *
FROM clean_2005_2018
UNION ALL
SELECT *
FROM lieux_2019_2021