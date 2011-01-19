#!/bin/bash

LOGOFILENAME="logo" #Name of the logo file without extension. You must have a png logo file in the directory.
MARGLEFT="44" #44 is the minimal left value
MARGTOP="84" #84 is the minimal top value
WIDTH=`file ./files/$LOGOFILENAME.png | cut -d',' -f2 | cut -d' ' -f2`
HEIGHT=`file ./files/$LOGOFILENAME.png | cut -d',' -f2 | cut -d' ' -f4`
THEMEPATH="/var/lib/tomcat6/webapps/univ-r_av/files/styles"
CONFFILE="/var/lib/tomcat6/webapps/univ-r_av/conf/univrav.properties"

if [ $WIDTH -gt "250" ] || [ $HEIGHT -gt "80" ]; then
echo "Logo is too big. Please resize it."
exit
else
MARGTOP="$(echo 80-$HEIGHT+$MARGTOP | bc)"
echo "/* Clickable zone, link to the ULPMM website */" > logozone.css
echo ".udsZone {" >> logozone.css
echo "  position: absolute;" >> logozone.css
echo "  width : ${WIDTH}px;" >> logozone.css
echo "  height: ${HEIGHT}px;" >> logozone.css
echo "  margin-left: ${MARGLEFT}px;" >> logozone.css
echo "  margin-top: ${MARGTOP}px;" >> logozone.css
echo "  background-image: url(../img/$LOGOFILENAME.png);" >> logozone.css
echo "  }" >> logozone.css

#For IE_6 (Installer imageMagick)
convert ./files/$LOGOFILENAME.png ./files/$LOGOFILENAME.gif
echo ".udsZone {" > logozone_ie6.css
echo "  background-image: url(../img/$LOGOFILENAME.gif);" >> logozone_ie6.css
echo "  }" >> logozone_ie6.css

cp -f ./logozone*.css $THEMEPATH/black-theme/css/
cp -f ./logozone*.css $THEMEPATH/blue-theme/css/
cp -f ./logozone*.css $THEMEPATH/orange-theme/css/
cp -f ./files/$LOGOFILENAME* $THEMEPATH/black-theme/img/
cp -f ./files/$LOGOFILENAME* $THEMEPATH/blue-theme/img/
cp -f ./files/$LOGOFILENAME* $THEMEPATH/orange-theme/img/
rm logozone*.css
rm ./files/$LOGOFILENAME.gif
chown -R tomcat6.tomcat6 $THEMEPATH/*

echo "At this point, the logo is now displayed correctly in the site."
echo "We will now modify the University parameters in the file univrav.properties."
read -p "Press Ctrl+c to stop or return to continue"
sed -i '/# University parameters/d' $CONFFILE
echo "# University parameters" >> $CONFFILE
echo "Changing univName"
sed -i '/univName/d' $CONFFILE
echo "univName = Université de Strasbourg" >> $CONFFILE

echo "Changing univAcronym"
sed -i '/univAcronym/d' $CONFFILE
echo "univName = UDS" >> $CONFFILE

echo "Changing univLink"
sed -i '/univLink/d' $CONFFILE
echo "univLink = http://www.unistra.fr" >> $CONFFILE

echo "Restarting Tomcat"
/etc/init.d/tomcat6 restart
fi

