#!/bin/bash

echo "Ce script doit être exécuté en tant que root"
echo "ATTENTION : Les configurations existantes de TOMCAT6, APACHE et VSFTPD seront écrasés"
echo "Veuillez remplacer le mot de passe 'a_changer' par vos mots de passe avant d'exécuter le script"
read -p "Appuyer sur 'entrée' pour continuer ou Ctrl+c pour stopper"

echo "Installation des packages nécessaires au fonctionnement du site"
apt-get install sun-java5-jre postgresql tomcat6 apache2 vsftpd vorbis-tools lame mp32ogg mplayer mencoder ffmpeg libavcodec-unstripped-52 libfaad0 mp3info zip unzip python2.6 python-reportlab mailx libpg-java libcommons-fileupload-java libcommons-io-java libcommons-lang-java libcommons-beanutils-java libcommons-collections3-java libcommons-logging-java ant subversion yamdi liblog4j1.2-java
apt-get install pgadmin3 #optionnel
echo "------------------------------------"

echo "Configuration du serveur ftp"
mkdir /audiovideocours
useradd -m -d /audiovideocours/ftp ftpuser
echo "Entrez le password pour ftpuser"
passwd ftpuser
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
svn co http://src.unistra.fr/svn/videocours/tags/server/release-2.17;mv release-2.17 univ-r_av
echo "------------------------------------"
echo "Configuration de postgres"
/etc/init.d/postgresql-8.3 restart
echo "Entrer un mot de passe pour sqluser"
cd /
su - postgres --command="createuser -P sqluser"
echo "------------------------------------"

echo "Création de la base et des tables de l'application"
su - postgres --command="createdb -O sqluser -E UTF8 univrav"
psql -h localhost -U sqluser -d univrav < /root/src/server/univ-r_av/WebContent/scripts/script_creation_database.sql
echo "------------------------------------"

echo "Configuration de Tomcat6"
/etc/init.d/tomcat6 stop
#tomcat-users.xml
cp /etc/tomcat6/tomcat-users.xml /etc/tomcat6/tomcat-users.xml.bak
echo "<?xml version='1.0' encoding='utf-8'?>" > /etc/tomcat6/tomcat-users.xml
echo "<tomcat-users>" >> /etc/tomcat6/tomcat-users.xml
echo "  <role rolename=\"tomcat\"/>" >> /etc/tomcat6/tomcat-users.xml
echo "  <role rolename=\"manager\"/>" >> /etc/tomcat6/tomcat-users.xml
echo "  <role rolename=\"ulpmm\"/>" >> /etc/tomcat6/tomcat-users.xml
echo " <user username=\"ulpmm\" password=\"a_changer\" roles=\"tomcat,manager,ulpmm\"/>" >> /etc/tomcat6/tomcat-users.xml
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
echo "			<Environment name=\"volume\" value=\"1\" type=\"java.lang.Short\" override=\"false\">" >> /etc/tomcat6/server.xml
echo "			<Resource name=\"jdbc/postgres\" auth=\"Container\" type=\"javax.sql.DataSource\" driverClassName=\"org.postgresql.Driver\" url=\"jdbc:postgresql://127.0.0.1:5432/univrav\" username=\"sqluser\" password=\"a_changer\" maxActive=\"20\" maxIdle=\"10\" maxWait=\"-1\"/>" >> /etc/tomcat6/server.xml
echo "			<Resource name=\"ldap/ox\" auth=\"Container\" type=\"com.sun.jndi.ldap.LdapCtx\" factory=\"org.ulpmm.univrav.dao.LdapFactory\" java.naming.factory.initial=\"com.sun.jndi.ldap.LdapCtxFactory\" java.naming.provider.url=\"a_changer\" java.naming.security.authentication=\"simple\" java.naming.security.principal=\"a_changer\" java.naming.security.credentials=\"a_changer\" com.sun.jndi.ldap.connect.pool=\"true\" java.naming.security.protocol=\"ssl\" com.sun.jndi.ldap.connect.timeout=\"5000\" com.sun.jndi.ldap.read.timeout=\"5000\"/>" >> /etc/tomcat6/server.xml
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
echo "  ServerName localhost" >> /etc/apache2/sites-available/univrav.conf
echo "  RewriteEngine On" >> /etc/apache2/sites-available/univrav.conf
echo "  RewriteCond %{HTTPS} off" >> /etc/apache2/sites-available/univrav.conf
echo "  RewriteRule ^/avc/myspace(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]" >> /etc/apache2/sites-available/univrav.conf
echo "  RewriteRule ^/admin(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]" >> /etc/apache2/sites-available/univrav.conf
echo "  RewriteRule ^/avc/admin(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]" >> /etc/apache2/sites-available/univrav.conf
echo "  RewriteRule ^/avc/publication(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]" >> /etc/apache2/sites-available/univrav.conf
echo "  RewriteRule ^/avc/authentification(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]" >> /etc/apache2/sites-available/univrav.conf
echo "  Include /etc/apache2/sites-available/univrav.include" >> /etc/apache2/sites-available/univrav.conf
echo "</VirtualHost>" >> /etc/apache2/sites-available/univrav.conf
echo "<VirtualHost *:443>" >> /etc/apache2/sites-available/univrav.conf
echo "  ServerName localhost" >> /etc/apache2/sites-available/univrav.conf
echo "#  SSLEngine On" >> /etc/apache2/sites-available/univrav.conf
echo "#  SSLCertificateFile /etc/ssl/univrav/site.cert" >> /etc/apache2/sites-available/univrav.conf
echo "#  SSLCertificateKeyFile /etc/ssl/univrav/site.key" >> /etc/apache2/sites-available/univrav.conf
echo "  Include /etc/apache2/sites-available/univrav.include" >> /etc/apache2/sites-available/univrav.conf
echo "</VirtualHost>" >> /etc/apache2/sites-available/univrav.conf

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

echo "Pensez à configurer le fichier univrav.properties et web.xml en suivant la doc, puis relancer Tomcat."
echo "Faite votre certificat, copier le dans le dossier adéquat et décommenter les lignes #  SSLEngine On #  SSLCertificateFile #  SSLCertificateKeyFile du fichier /etc/apache2/sites-available/univrav.conf"
echo "Une fois le certificat en place, relancer apache /etc/init.d/apache2 restart"
echo "Accéder à l'application via http://localhost/univ-r_av"
