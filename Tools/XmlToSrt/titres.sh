#!/bin/sh

#constantes
chemin_fichier="/audiovideocours/cours/1/00/"
exe_python="/var/lib/tomcat6/webapps/univ-r_av/scripts/to_srt.py"
#Finding files like *_captions.xml
cd $chemin_fichier
find . -type f -name '*_captions.xml'  > /tmp/filelist.txt
#read the line
for line in $(cat /tmp/filelist.txt)
do 
        echo "$line"
        chemin=${line%/*}
        fichier=${line##*/}
        base=${fichier%%.*}
        ext=${fichier#*.} 
        echo "$chemin | $fichier | $base | $ext" 
	#verifier que le srt n'existe pas
        test_srt=$chemin"/"$base".srt"
        echo $test_srt
        if [ -f $test_srt ]
        then
                echo "srt found" 
        else
                echo "creating srt file based on "$chemin"/"$base"."$ext
		echo " new file "$chemin"/"$base".srt"   
		python $exe_python -t $chemin"/"$base"."$ext $chemin"/"$base".srt" 
                chown "tomcat6:di" $chemin"/"$filename".srt"         
        fi


done



