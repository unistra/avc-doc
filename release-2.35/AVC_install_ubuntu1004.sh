#!/bin/bash
echo "Ce script doit être exécuté en tant que root pour une distribution ubuntu 10.04"
echo "ATTENTION : Les configurations existantes de TOMCAT6, APACHE et VSFTPD seront écrasés"
echo "Veuillez remplacer 'a_changer' dans les variables avant d'exécuter le script"
read -p "Appuyer sur 'entrée' pour continuer ou Ctrl+c pour stopper"

SERVER_FLUX_ENC="none"					#none, light, apache. none -> pas de streaming, light -> serveur de streaming dédié lighttpd et encodage séparé, apache -> encodage local et streaming sur apache
NOMFTPUSER="ftpuser"					#Utilisateur du ftp pour le client
PASSFTPUSER="a_changer"					#Mot de passe de l'utilisateur FTP
IP_SQLSERVER="127.0.0.1"				#L'ip du serveur sql
PORT_SQLSERVER="5432"					#Le port du serveur sql 5432 par défaut
LOGIN_SQL="a_changer"					#L'utilisateur sql de tomcat autorisé à se connecter
MOTPASS_SQL="a_changer"					#Son mot de passe
NOMBASE="univrav"					#Nom de la base à créer pour le site
LOGIN_TOMCAT_USER="a_changer"				#login de l'utilisateur dans tomcat_user.xml. Il sert pour les pages d'admin du site
MOTPASS_TOMCAT_USER="a_changer"				#Mot de passe de l'utilisateur tomcat.userxml
SERVERBASE_TOMCAT_SQL="$IP_SQLSERVER:$PORT_SQLSERVER/$NOMBASE"	#L'ip du serveur postgres, le port et la base : ip_server:port/base
TOMCAT_LDAP_URL="a_changer"				#L'adresse du serveur LDAP avec le port ex:ldaps://votreurlldap.domain:636
TOMCAT_LDAP_SEC_MAIN="a_changer"			#Le login de l'utilisateur LDAP ex:cn=toto,ou=tata,ou=titi,o=tutu
TOMCAT_LDAP_SEC_CRED="a_changer"			#Le mot de passe de l'utilisateur LDAP
URLJOBBACK="http://localhost/univ-r_av"			#Url de votre serveur pour les jobs. Ex: URLJOBBACK="http://audiovideocours.u-strasbg.fr"
CAS_URL="https:\/\/cas.unistra.fr"			#Mettez l'url de votre serveur cas

STARTDIR=`pwd`
SUBMOTPASSESQL=$(python -c "print '$MOTPASS_SQL'.replace('$','\\\$')")
echo "Installation des packages nécessaires au fonctionnement du site"
apt-get update
apt-get upgrade
apt-get install postgresql tomcat6 apache2 vsftpd zip unzip mailutils libpg-java libcommons-fileupload-java libcommons-io-java libcommons-lang-java libcommons-beanutils-java libcommons-collections3-java libcommons-logging-java ant subversion liblog4j1.2-java openjdk-6-jdk
#paquets pour l'encodage
apt-get install vorbis-tools lame mplayer mencoder ffmpeg libavcodec-unstripped-52 eyeD3 ffmpeg2theora yamdi faac zip unzip python2.6 python-reportlab python-psycopg2 atomicparsley bc
#apt-get install pgadmin3 #optionnel
echo "------------------------------------"

echo "Configuration du serveur ftp"
mkdir /audiovideocours
useradd -m -d /audiovideocours/ftp $NOMFTPUSER
echo "$NOMFTPUSER:$PASSFTPUSER"|chpasswd
mkdir -p /audiovideocours/ftp/canceled /audiovideocours/ftp/client_update /audiovideocours/ftp/live /audiovideocours/ftp/releases
mkdir -p /audiovideocours/cours

sed -i 's/anonymous_enable=YES/anonymous_enable=NO/' /etc/vsftpd.conf
sed -i 's/#local_enable=YES/local_enable=YES/' /etc/vsftpd.conf
sed -i 's/#write_enable=YES/write_enable=YES/' /etc/vsftpd.conf
sed -i 's/#local_umask=022/local_umask=022/' /etc/vsftpd.conf
sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/' /etc/vsftpd.conf
echo "local_root=/audiovideocours/ftp" >> /etc/vsftpd.conf
/etc/init.d/vsftpd restart
echo "-------------------------------------"

echo "Récupération des sources du projet"
mkdir -p /root/src/server; cd /root/src/server
svn co https://subversion.cru.fr/audiovideocours/tags/server/release-2.35/; mv release-2.35 univ-r_av
echo "------------------------------------"
echo "Récupération du player flash JW player"
echo "Licence : Creative Commons : Attribution-Noncommercial-Share Alike 3.0 Unported"
echo "http://creativecommons.org/licenses/by-nc-sa/3.0/"
cat /root/src/server/univ-r_av/WebContent/files/jwflvplayer/readme.txt
read -p "Appuyer sur 'entrée' pour accepter la licence et continuer l'installation ou Ctrl+c pour stopper"
wget http://audiovideocours.u-strasbg.fr/releases/player.swf
mv player.swf /root/src/server/univ-r_av/WebContent/files/jwflvplayer/
echo "------------------------------------"

echo "Configuration de postgres"
/etc/init.d/postgresql-8.4 restart
cd /
su - postgres --command="psql -d template1 -c \"create user $LOGIN_SQL with password '$SUBMOTPASSESQL' CREATEDB CREATEROLE\""
echo "------------------------------------"

echo "Création de la base et des tables de l'application"
su - postgres --command="createdb -O $LOGIN_SQL -E UTF8 $NOMBASE"
export PGPASSWORD=$MOTPASS_SQL
psql -h $IP_SQLSERVER -U $LOGIN_SQL -d $NOMBASE -f /root/src/server/univ-r_av/WebContent/scripts/script_creation_database.sql
echo "------------------------------------"

echo "Configuration de Tomcat6"
/etc/init.d/tomcat6 stop
#tomcat-users.xml
cp /etc/tomcat6/tomcat-users.xml /etc/tomcat6/tomcat-users.xml.bak
echo "<?xml version='1.0' encoding='utf-8'?>" > /etc/tomcat6/tomcat-users.xml
echo "<tomcat-users>" >> /etc/tomcat6/tomcat-users.xml
echo "  <role rolename=\"tomcat\"/>" >> /etc/tomcat6/tomcat-users.xml
echo "  <role rolename=\"manager\"/>" >> /etc/tomcat6/tomcat-users.xml
echo "  <role rolename=\"gp\"/>" >> /etc/tomcat6/tomcat-users.xml
echo "  <role rolename=\"$LOGIN_TOMCAT_USER\"/>" >> /etc/tomcat6/tomcat-users.xml
echo " <user username=\"$LOGIN_TOMCAT_USER\" password=\"$MOTPASS_TOMCAT_USER\" roles=\"tomcat,manager,ulpmm,gp\"/>" >> /etc/tomcat6/tomcat-users.xml
echo "</tomcat-users>" >> /etc/tomcat6/tomcat-users.xml

#server.xml
cp /etc/tomcat6/server.xml /etc/tomcat6/server.xml.bak
echo "<?xml version='1.0' encoding='utf-8'?>" > /etc/tomcat6/server.xml
echo "<Server port=\"8005\" shutdown=\"SHUTDOWN\">" >> /etc/tomcat6/server.xml
echo "  <Listener className=\"org.apache.catalina.core.JasperListener\" />" >> /etc/tomcat6/server.xml
echo "  <Listener className=\"org.apache.catalina.mbeans.ServerLifecycleListener\" />" >> /etc/tomcat6/server.xml
echo "  <Listener className=\"org.apache.catalina.mbeans.GlobalResourcesLifecycleListener\" />" >> /etc/tomcat6/server.xml
echo "  <GlobalNamingResources>" >> /etc/tomcat6/server.xml
echo "    <Resource name=\"UserDatabase\" auth=\"Container\" type=\"org.apache.catalina.UserDatabase\" description=\"User database that can be updated and saved\" factory=\"org.apache.catalina.users.MemoryUserDatabaseFactory\" pathname=\"conf/tomcat-users.xml\" />" >> /etc/tomcat6/server.xml
echo "  </GlobalNamingResources>" >> /etc/tomcat6/server.xml
echo "  <Service name=\"Catalina\">" >> /etc/tomcat6/server.xml
echo "    <Connector port=\"8080\" protocol=\"HTTP/1.1\" connectionTimeout=\"20000\" redirectPort=\"443\" />" >> /etc/tomcat6/server.xml
echo "    <Connector port=\"8009\" protocol=\"AJP/1.3\" redirectPort=\"443\" />" >> /etc/tomcat6/server.xml
echo "    <Engine name=\"Catalina\" defaultHost=\"localhost\">" >> /etc/tomcat6/server.xml
echo "      <Realm className=\"org.apache.catalina.realm.UserDatabaseRealm\" resourceName=\"UserDatabase\"/>" >> /etc/tomcat6/server.xml
echo "      <Host name=\"localhost\"  appBase=\"webapps\" unpackWARs=\"true\" autoDeploy=\"true\" xmlValidation=\"false\" xmlNamespaceAware=\"false\">" >> /etc/tomcat6/server.xml
echo "		<Context path=\"/univ-r_av\" docBase=\"univ-r_av\">" >> /etc/tomcat6/server.xml
echo "			<Environment name=\"volume\" value=\"1\" type=\"java.lang.Short\" override=\"false\"/>" >> /etc/tomcat6/server.xml
echo "			<Resource name=\"jdbc/postgres\" auth=\"Container\" type=\"javax.sql.DataSource\" driverClassName=\"org.postgresql.Driver\" url=\"jdbc:postgresql://$SERVERBASE_TOMCAT_SQL\" username=\"$LOGIN_SQL\" password=\"$MOTPASS_SQL\" maxActive=\"20\" maxIdle=\"10\" maxWait=\"-1\"/>" >> /etc/tomcat6/server.xml
echo "			<Resource name=\"ldap/ox\" auth=\"Container\" type=\"com.sun.jndi.ldap.LdapCtx\" factory=\"org.ulpmm.univrav.dao.LdapFactory\" java.naming.factory.initial=\"com.sun.jndi.ldap.LdapCtxFactory\" java.naming.provider.url=\"$TOMCAT_LDAP_URL\" java.naming.security.authentication=\"simple\" java.naming.security.principal=\"$TOMCAT_LDAP_SEC_MAIN\" java.naming.security.credentials=\"$TOMCAT_LDAP_SEC_CRED\" com.sun.jndi.ldap.connect.pool=\"true\" java.naming.security.protocol=\"ssl\" com.sun.jndi.ldap.connect.timeout=\"5000\" com.sun.jndi.ldap.read.timeout=\"5000\"/>" >> /etc/tomcat6/server.xml
echo "		</Context>" >> /etc/tomcat6/server.xml
echo "      </Host>" >> /etc/tomcat6/server.xml
echo "    </Engine>" >> /etc/tomcat6/server.xml
echo "  </Service>" >> /etc/tomcat6/server.xml
echo "</Server>" >> /etc/tomcat6/server.xml

sed -i 's/TOMCAT6_SECURITY=yes/TOMCAT6_SECURITY=no/' /etc/init.d/tomcat6
echo "------------------------------------"

echo "Création du war et déploiement du site"
cd /root/src/server/univ-r_av
ln -s /usr/share/java/commons-io.jar /usr/share/tomcat6/lib/commons-io.jar
ln -s /usr/share/java/commons-fileupload.jar /usr/share/tomcat6/lib/commons-fileupload.jar
ln -s /usr/share/java/postgresql-jdbc3.jar /usr/share/tomcat6/lib/postgresql-jdbc3.jar
ln -s /usr/share/java/commons-lang.jar /usr/share/tomcat6/lib/commons-lang.jar
ln -s /usr/share/java/commons-beanutils.jar /usr/share/tomcat6/lib/commons-beanutils.jar
ln -s /usr/share/java/commons-collections3.jar /usr/share/tomcat6/lib/commons-collections3.jar
ln -s /usr/share/java/commons-logging.jar /usr/share/tomcat6/lib/commons-logging.jar
ln -s /usr/share/java/log4j-1.2.jar /usr/share/tomcat6/lib/log4j-1.2.jar
ant
cp /root/dev/war/univ-r_av.war /var/lib/tomcat6/webapps
/etc/init.d/tomcat6 start
chmod -R 777 /audiovideocours
echo "------------------------------------"

echo "Configuration d'Apache2"
a2enmod proxy proxy_ajp proxy_balancer proxy_http rewrite ssl
#création du fichier univrav.conf
echo "<VirtualHost *:80>" > /etc/apache2/sites-available/univrav.conf
echo "ServerName localhost" >> /etc/apache2/sites-available/univrav.conf
echo "RewriteEngine On" >> /etc/apache2/sites-available/univrav.conf
echo "RewriteCond %{HTTPS} off" >> /etc/apache2/sites-available/univrav.conf
echo "RewriteRule ^(.*)/avc/myspace(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]" >> /etc/apache2/sites-available/univrav.conf
echo "RewriteRule ^(.*)/admin(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]" >> /etc/apache2/sites-available/univrav.conf
echo "RewriteRule ^(.*)/avc/admin(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]" >> /etc/apache2/sites-available/univrav.conf
echo "RewriteRule ^(.*)/avc/publication(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]" >> /etc/apache2/sites-available/univrav.conf
echo "RewriteRule ^(.*)/avc/authentification(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]" >> /etc/apache2/sites-available/univrav.conf
echo "Include /etc/apache2/sites-available/univrav.include" >> /etc/apache2/sites-available/univrav.conf
echo "</VirtualHost>" >> /etc/apache2/sites-available/univrav.conf
echo "#<VirtualHost *:443>" >> /etc/apache2/sites-available/univrav.conf
echo "#ServerName localhost" >> /etc/apache2/sites-available/univrav.conf
echo "#SSLEngine On" >> /etc/apache2/sites-available/univrav.conf
echo "#SSLCertificateFile /etc/ssl/univrav/site.cert" >> /etc/apache2/sites-available/univrav.conf
echo "#SSLCertificateKeyFile /etc/ssl/univrav/site.key" >> /etc/apache2/sites-available/univrav.conf
echo "#Include /etc/apache2/sites-available/univrav.include" >> /etc/apache2/sites-available/univrav.conf
echo "#RewriteEngine On" >> /etc/apache2/sites-available/univrav.conf
echo "#RewriteCond %{HTTPS} on" >> /etc/apache2/sites-available/univrav.conf
echo "#RewriteRule ^(.*)/avc/courseaccess(.*)$ http://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]" >> /etc/apache2/sites-available/univrav.conf
echo "#RewriteRule ^(.*)/avc/liveaccess(.*)$ http://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]" >> /etc/apache2/sites-available/univrav.conf
echo "#</VirtualHost>" >> /etc/apache2/sites-available/univrav.conf

#création du fichier univrav.include
echo "ServerAdmin webmaster@localhost" > /etc/apache2/sites-available/univrav.include
echo "DocumentRoot /var/lib/tomcat6/webapps/univ-r_av" >> /etc/apache2/sites-available/univrav.include
echo "Options -Indexes" >> /etc/apache2/sites-available/univrav.include
echo "<Proxy *>" >> /etc/apache2/sites-available/univrav.include
echo "Allow from all" >> /etc/apache2/sites-available/univrav.include
echo "</Proxy>" >> /etc/apache2/sites-available/univrav.include
echo "<Proxy balancer://tomcat>" >> /etc/apache2/sites-available/univrav.include
echo "BalancerMember ajp://127.0.0.1:8009 route=localhost connectiontimeout=1000" >> /etc/apache2/sites-available/univrav.include
echo "</Proxy>" >> /etc/apache2/sites-available/univrav.include
echo "ProxyPass /coursv2 !" >> /etc/apache2/sites-available/univrav.include
echo "Alias /coursv2 \"/audiovideocours/cours/\"" >> /etc/apache2/sites-available/univrav.include
echo "ProxyPass /live !" >> /etc/apache2/sites-available/univrav.include
echo "Alias /live \"/audiovideocours/ftp/live/\"" >> /etc/apache2/sites-available/univrav.include
echo "ProxyPass /releases !" >> /etc/apache2/sites-available/univrav.include
echo "Alias /releases \"/audiovideocours/ftp/releases/\"" >> /etc/apache2/sites-available/univrav.include
echo "ProxyPass /balancer-manager !" >> /etc/apache2/sites-available/univrav.include
echo "<Location /balancer-manager>" >> /etc/apache2/sites-available/univrav.include
echo "SetHandler balancer-manager" >> /etc/apache2/sites-available/univrav.include
echo "Order Deny,Allow" >> /etc/apache2/sites-available/univrav.include
echo "Deny from all" >> /etc/apache2/sites-available/univrav.include
echo "Allow from 127.0.0.1" >> /etc/apache2/sites-available/univrav.include
echo "</Location>" >> /etc/apache2/sites-available/univrav.include
echo "ProxyPass / balancer://tomcat/ stickysession=JSESSIONID|jsessionid" >> /etc/apache2/sites-available/univrav.include
echo "ProxyPassReverse / balancer://tomcat/ stickysession=JSESSIONID|jsessionid" >> /etc/apache2/sites-available/univrav.include
echo "ErrorLog /var/log/apache2/error-univ-rav.log" >> /etc/apache2/sites-available/univrav.include
echo "LogLevel warn" >> /etc/apache2/sites-available/univrav.include
echo "CustomLog /var/log/apache2/access-univ-rav.log combined" >> /etc/apache2/sites-available/univrav.include
echo "ServerSignature Off" >> /etc/apache2/sites-available/univrav.include

a2dissite default
a2ensite univrav.conf

/etc/init.d/apache2 restart
echo "------------------------------------"
echo "Modification du fichier /var/lib/tomcat6/webapps/univ-r_av/conf/univrav.properties et /var/lib/tomcat6/webapps/univ-r_av/WEB-INF/web/xml"
sed -i 's/http:\/\/audiovideocours.u-strasbg.fr/http:\/\/localhost\/univ-r_av/' /var/lib/tomcat6/webapps/univ-r_av/conf/univrav.properties
sed -i 's/coursesUrl\ =\ http:\/\/localhost\/univ-r_av\/coursv2\//coursesUrl\ =\ http:\/\/localhost\/coursv2\//' /var/lib/tomcat6/webapps/univ-r_av/conf/univrav.properties
sed -i 's/adminEmail1=elaemmer@unistra.fr/adminEmail1=yourmail@mail.fr/' /var/lib/tomcat6/webapps/univ-r_av/conf/univrav.properties
sed -i 's/adminEmail2=morgan.bohn@unistra.fr/adminEmail2=/' /var/lib/tomcat6/webapps/univ-r_av/conf/univrav.properties
sed -i 's/adminEmail3=schnellf@unistra.fr/adminEmail3=/' /var/lib/tomcat6/webapps/univ-r_av/conf/univrav.properties
sed -i 's/audiovideocours.u-strasbg.fr/localhost/' /var/lib/tomcat6/webapps/univ-r_av/WEB-INF/web.xml
sed -i 's/https:\/\/cas.unistra.fr/'$CAS_URL'/' /var/lib/tomcat6/webapps/univ-r_av/WEB-INF/web.xml
echo "------------------------------------"

#Partie stream apache2 si apache sert aussi les flux
if [ $SERVER_FLUX_ENC = "apache" ]; then
echo "Installation du streaming pour apache2"
cd root
echo "Récupération des sources des modules"
wget http://github.com/osantana/mod_flvx/raw/master/mod_flvx.c
wget http://h264.code-shop.com/download/apache_mod_h264_streaming-2.2.7.tar.gz
tar -zxvf apache_mod_h264_streaming-2.2.7.tar.gz
echo "Installation des outils de dév apache"
apt-get install apache2-threaded-dev
echo "Compilation et installation du module flvx"
apxs2 -i -a -c mod_flvx.c
a2enmod flvx
echo "AddHandler flv-stream .flv" >> /etc/apache2/apache2.conf
echo "Compilation et installation du module h264"
cd mod_h264_streaming-2.2.7
./configure --with-apxs=`which apxs2`
make
make install
echo "LoadModule h264_streaming_module /usr/lib/apache2/modules/mod_h264_streaming.so" > /etc/apache2/mods-available/h264.load
a2enmod h264
echo "AddHandler h264-streaming.extensions .mp4" >> /etc/apache2/apache2.conf
/etc/init.d/apache2 restart
fi

if [ $SERVER_FLUX_ENC = "light" ]; then
echo "Installation de lighttpd avec les modules de streaming et encodage séparé"

#----------------------------------
#Partie lighttpd stream si serveur de flux dédié et encodage séparé
#Copie job_encodage si encodage séparé
cp -R /root/src/server/univ-r_av/WebContent/scripts/jobs_encodage /audiovideocours/cours/
sed -i 's/dbapi2.connect.*/dbapi2.connect(\"host='\''localhost'\'' dbname='\'$NOMBASE\'' user='\'$LOGIN_SQL\'' password='\'$MOTPASS_SQL\''\")/' /audiovideocours/cours/jobs_encodage/accessbase.py
#Modification du fichier univrav.properties
sed -i 's/coursesUrl\ =\ http:\/\/localhost\/univ-r_av\/coursv2\//coursesUrl\ =\ http:\/\/localhost:81\//' /var/lib/tomcat6/webapps/univ-r_av/conf/univrav.properties
sed -i 's/sepEnc=false/sepEnc=true/' /var/lib/tomcat6/webapps/univ-r_av/conf/univrav.properties
#ligne cron
echo "1-59/2 *        * * *   root    nice -n 19 bash /audiovideocours/cours/jobs_encodage/JobEnc.sh /audiovideocours/cours/jobs_encodage $URLJOBBACK /audiovideocours/cours &> /dev/null" >> /etc/crontab
bash $STARTDIR/AVC_light.sh
fi
/etc/init.d/tomcat6 restart
echo "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
echo "Pensez à configurer le fichier univrav.properties et web.xml en suivant la doc, puis relancer Tomcat."
echo "Faite votre certificat, copier le dans le dossier adéquat et décommenter le bloc <VirtualHost *:443> du fichier /etc/apache2/sites-available/univrav.conf"
echo "Une fois le certificat en place, relancer apache /etc/init.d/apache2 restart"
echo "Accéder à l'application via http://localhost/univ-r_av"
echo "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
