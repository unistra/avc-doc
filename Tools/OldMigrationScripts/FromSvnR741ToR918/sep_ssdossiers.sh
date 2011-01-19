#!/bin/bash

$DOSSCOURS="/audiovideocours/cours"

cd $DOSSCOURS
for nom in `ls`
do
if [ $nom != "lost+found" ] && [ $nom != "1" ]; then 
nomm=`echo $nom | rev|cut -d- -f1|rev`
Nb=`printf "%.8d" $nomm`
echo $Nb
rep1=`echo $Nb | cut -c1,2`
rep2=`echo $Nb | cut -c3,4`
rep3=`echo $Nb | cut -c5,6`
rep4=`echo $Nb | cut -c7,8`
echo "mkdir -p 1/$rep1/$rep2/$rep3/"
echo "mv $nom 1/$rep1/$rep2/$rep3/$rep4"
fi 
done
chown tomcat6.tomcat6 -R $DOSSCOURS/1
