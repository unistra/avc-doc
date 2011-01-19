Attention, ces scripts sont en état alpha et donc à utiliser avec prudence. Prenez bien soin de travailler sur un backup de votre base et de vos enregistrements.

/***********************************************/
Migration des bases.
/**********************************************/
Les commandes sql à lancer dans pgadmin sur votre base sont disponibles dans le dossier "code sql"
Chaque passage d'une révision à l'autre dispose d'un fichier sql

Liste des modifications sur la base entre les différentes versions
-----------------------------
Entre r741 et r829
table course
Ajout de la colonne mediatype (integer)
Remplissage du mediatype
Suppression de la colonne highquality (boolean)

------------
Entre r829 et r863
table course
Ajout de la colonne volume (smallint)
Supprimer colonne Mediafolder

------------
Entre r863 et r872
Création de la table job
Création de la séquence job
Suppression de la table Univr

------------
Entre r872 et r884
Création d'une table discipline
Création d'une séquence discipline
Création d'une table level
création d'une séquence level

Modification table user
ajout d'une colonne etp (character varying)

------------
Entre r884 et r918
Replacer la valeur de la séquence discipline
Replacer la valeur de la séquence level

/****************************************************/
Modification de la structure des dossiers
/****************************************************/
Régler le script "sep_ssdossiers.sh", notamment la variable $DOSSCOURS
Lancer le script eb root

/***************/
Notes
/***************/
qt-faststart : Il est nécessaire pour bénéficier du streaming, de traiter les fichier "mp4" avec cet outil.
yamdi : Il est nécessaire pour bénéficier du streaming, de traiter les fichier "flv" avec cet outil.
