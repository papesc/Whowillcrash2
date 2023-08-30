with
    cat_2005_2018 as (
        select *
        from `datagouv.caracteristiques_2005`
        union all
        select *
        from `datagouv.caracteristiques_2006`
        union all
        select *
        from `datagouv.caracteristiques_2007`
        union all
        select *
        from `datagouv.caracteristiques_2008`
        union all
        select *
        from `datagouv.caracteristiques_2009`
        union all
        select *
        from `datagouv.caracteristiques_2010`
        union all
        select *
        from `datagouv.caracteristiques_2011`
        union all
        select *
        from `datagouv.caracteristiques_2012`
        union all
        select *
        from `datagouv.caracteristiques_2013`
        union all
        select *
        from `datagouv.caracteristiques_2014`
        union all
        select *
        from `datagouv.caracteristiques_2015`
        union all
        select *
        from `datagouv.caracteristiques_2016`
        union all
        select *
        from `datagouv.caracteristiques_2017`
        union all
        select *
        from `datagouv.caracteristiques_2018`
    ),
    cat_2019_2021 as (
        select
            num_acc,
            an,
            mois,
            jour,
            hrmn,
            dep,
            com,
            agg,
            int,
            atm
        from `datagouv.caracteristiques_2019_2020_2021`
    ),
    union_allyears as (
        select
            num_acc,
            an,
            mois,
            jour,
            cast(hrmn as string) as hrmn,
            CAST(dep AS STRING) as dep,
            cast(com as string) as com,
            agg,
            int,
            atm
        from cat_2005_2018
        union all
        select
            num_acc, an, mois, jour, hrmn, dep, com, agg, int, atm
        from cat_2019_2021
    )
select
    num_acc,
    case
        when an = 5
        then 2005
        when an = 6
        then 2006
        when an = 7
        then 2007
        when an = 8
        then 2008
        when an = 9
        then 2009
        when an = 10
        then 2010
        when an = 11
        then 2011
        when an = 12
        then 2012
        when an = 13
        then 2013
        when an = 14
        then 2014
        when an = 15
        then 2015
        when an = 16 then 2016
        when an = 17 then 2017
        when an = 18 then 2018
        when an =2019 then 2019
        when an=2020 then 2020
        when an=2021 then 2021
    end as an,
    mois,
    jour,
    hrmn,
    dep,
    agg,
    int,
    atm
from union_allyears
