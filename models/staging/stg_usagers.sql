SELECT Num_Acc, an_nais,
    CASE WHEN grav = 4 THEN 'Blessé léger' # remplacer 1 2 3 4 de la gravité de laccident 
    WHEN grav = 3 THEN 'Blessé hospitalisé '
    WHEN grav = 2 THEN 'Tué '
    WHEN grav = 1 THEN 'Indemne'
    ELSE 'N/A'
    END AS gravite,

    CASE WHEN trajet = 9 THEN 'Autre' # indications sur le type de trajet
    WHEN trajet = 1 THEN 'Domicile travail'
    WHEN trajet = 2 THEN 'Domicile école'
    WHEN trajet = 3 THEN 'Courses'
    WHEN trajet = 4 THEN 'Utilisation professionnelle'
    WHEN trajet = 5 THEN 'Loisir'
    ELSE 'N/A'
    END AS trajet,

    
    CASE WHEN catu = 1 THEN 'Conducteur' # remplacer 1 2 3 par conducteur piéton ou passager
    WHEN catu = 2 THEN 'Passager'
    WHEN catu = 3 THEN 'Piéton'
    END AS cat_usager,

    CASE WHEN sexe = 1 THEN 'H'
    WHEN sexe = 2 THEN 'F'
    ELSE 'N/A'
    END AS sexe,

    CASE WHEN secu1 = 0 THEN 'Aucun équipement' # indications sur la sécu
    WHEN secu1 = 1 THEN 'Ceinture'
    WHEN secu1  = 2 THEN 'Casque'
    WHEN secu1  = 3 THEN 'Dispositif enfants'
    WHEN secu1  = 4 THEN 'Gilet réfléchissant'
    WHEN secu1  = 5 THEN 'Airbag'
    WHEN secu1 = 6 THEN 'Gants'
    WHEN secu1 = 7 THEN 'Gants_airbag'
    WHEN secu1 = 8 THEN 'Non determinable'
    WHEN secu1 = 9 THEN 'Autre'
    ELSE 'N/A'
    END AS equipement_securite,

    CASE WHEN secu2 = 0 THEN 'Aucun équipement' # indications sur la sécu
    WHEN secu2 = 1 THEN 'Ceinture'
    WHEN secu2  = 2 THEN 'Casque'
    WHEN secu2  = 3 THEN 'Dispositif enfants'
    WHEN secu2  = 4 THEN 'Gilet réfléchissant'
    WHEN secu2  = 5 THEN 'Airbag'
    WHEN secu2 = 6 THEN 'Gants'
    WHEN secu2 = 7 THEN 'Gants_airbag'
    WHEN secu2 = 8 THEN 'Non determinable'
    WHEN secu2 = 9 THEN 'Autre'
    ELSE 'N/A'
    END AS equipement_securite2, 

    id_vehicule, num_veh,

FROM {{ref('usagers')}}