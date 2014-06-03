#!/bin/bash

#Lighttpd
#Créer un répertoire de travail
mkdir -p /root/lightty
cd /root/lightty
#Installation des outils à la compilation du paquet
apt-get install build-essential fakeroot dpkg-dev
#Récupérer les sources :
VERSIONSOURCE=`apt-cache showsrc lighttpd | grep "Version:" | head -n 1 | cut -d' ' -f2`
if [ `arch` = x86_64 ]; then
ARCHITECTURE="amd64"
else
ARCHITECTURE="i386"
fi
apt-get source lighttpd
aptitude build-dep lighttpd
wget http://h264.code-shop.com/download/lighttpd-1.4.18_mod_h264_streaming-2.2.9.tar.gz
tar xvzf lighttpd-1.4.18_mod_h264_streaming-2.2.9.tar.gz
dpkg-source -x lighttpd_"$VERSIONSOURCE".dsc
#Modification des sources
#Créer le script contenant le code suivant à la racine du répertoire courant : 
cd lighttpd-1.4.18/src
cp -v mod_h264_streaming.c mod_streaming_export.h moov.c moov.h mp4_io.c mp4_io.h mp4_reader.c mp4_reader.h mp4_writer.c mp4_writer.h mp4_process.c mp4_process.h output_bucket.c output_bucket.h output_mp4.c output_mp4.h ../../lighttpd-1.4.26/src/

#Ajouter les ordres de compilation du module MP4 au fichier lighttpd-1.4.26/src/Makefile.am (avant la ligne “lib_LTLIBRARIES += mod_flv_streaming.la” par exemple) : 
sed -i 's/lib_LTLIBRARIES += mod_flv_streaming.la/lib_LTLIBRARIES += mod_h264_streaming.la\nmod_h264_streaming_la_SOURCES = mod_h264_streaming.c \\\nmod_streaming_export.h \\\nmoov.c moov.h \\\nmp4_io.c mp4_io.h \\\nmp4_reader.c mp4_reader.h \\\nmp4_writer.c mp4_writer.h \\\nmp4_process.c mp4_process.h \\\noutput_bucket.c output_bucket.h \\\noutput_mp4.c output_mp4.h\nmod_h264_streaming_la_CFLAGS = $(AM_CFLAGS) -DBUILDING_H264_STREAMING\nmod_h264_streaming_la_LDFLAGS = -module -export-dynamic -avoid-version -no-undefined\nmod_h264_streaming_la_LIBADD = $(common_libadd)\n\nlib_LTLIBRARIES += mod_flv_streaming.la/' /root/lightty/lighttpd-1.4.26/src/Makefile.am

#Indiquer au paquet Ubuntu l'emplacement du module MP4 :
cd /root/lightty/
echo debian/tmp/usr/lib/lighttpd/mod_h264_streaming.so >> lighttpd-1.4.26/debian/lighttpd.install

#Compilation du paquet
#Lancer ces commandes afin de créer le paquet : 
cd lighttpd-1.4.26
dpkg-buildpackage -b -rfakeroot

#Installation du paquet
#Petite subtilité ici, la commande "hold" d'aptitude qui permet d'indiquer que l'on souhaite conserver le paquet lighttpd à sa version actuelle même si une mise à jour est disponible : 
cd ..
sudo dpkg -i lighttpd_"$VERSIONSOURCE"_"$ARCHITECTURE".deb #Attention, si archi différente de amd64 ou i386
sudo aptitude hold lighttpd

#config lighttpd
sed -i 's/\"mod_flv_streaming\",/\n\"mod_flv_streaming\", \n\"mod_h264_streaming\",/' /etc/lighttpd/lighttpd.conf
sed -i 's/server.document-root.*/server.document-root=\"\/audiovideocours\/cours\/\"/' /etc/lighttpd/lighttpd.conf
echo "h264-streaming.extensions = ( \".mp4\" )" >> /etc/lighttpd/lighttpd.conf
echo "flv-streaming.extensions = ( \".flv\" )" >> /etc/lighttpd/lighttpd.conf
echo "server.port = 81" >> /etc/lighttpd/lighttpd.conf
/etc/init.d/lighttpd restart
