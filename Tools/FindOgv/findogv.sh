#!/bin/bash


NOW=$(date +"%b-%d-%Y-%Hh_%Mmm_%Ss")

LOG="log-$NOW.log"
(

chemin_travail="/audiovideocours/cours/1/00/"
chemin_log="/findogv/"
fichier_rep=$NOW"_listefichiers.txt"

find $chemin_travail -type f -name '*.ogv' > $chemin_log"/"$fichier_rep


for fichier in $(cat $chemin_log"/"$fichier_rep)
do 
        echo "$fichier"
        rm -f $fichier
done  

) 2>&1 | tee -a $chemin_log"/"$LOG

exit 1



