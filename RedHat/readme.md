<p><br></p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2luZm99&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="info" data-macro-body-type="RICH_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2luZm99&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><p>Cette
 documentation n'a pas encore été testée "from scratch". Par conséquent,
 si vous identifiez des manques ou des erreurs ou que vous avez des 
suggestions à faire, merci de les envoyer à <a href="mailto:nicolas.truchaud@univ-lyon2.fr" data-mce-href="mailto:nicolas.truchaud@univ-lyon2.fr">nicolas.truchaud@univ-lyon2.fr</a>.</p></td></tr></tbody></table><p><span><br></span></p><p><span><img class="editor-inline-macro" src="http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro?definition=e3RvY30&amp;locale=fr_FR&amp;version=2" data-macro-name="toc" data-mce-src="http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro?definition=e3RvY30&amp;locale=fr_FR&amp;version=2"></span></p><h2><span>1. Installation de la distribution</span></h2><h3><span>a. Installation des packages n</span><span>é</span><span>cessaires au fonctionnement du site : </span></h3><div class="page" title="Page 3"><div class="column"><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ yum install postgresql pgadmin3 tomcat6 httpd vsftpd zip unzip mailx libpg­java libcommons­fileupload­java libcommons­io­java libcommons­lang­java libcommons­beanutils­java libcommons­collections3­java libcommons­logging­java ant subversion liblog4j1.2­java openjdk­6­jdk </pre></td></tr></tbody></table><p><br></p></div><h3 class="column">b. Paquets pour l'encodage</h3></div><p><span>Les paquets nécessaires pour l'encodage sont :</span></p><p><span><code><span>vorbis­tools
 lame ffmpeg libavcodec­extra­53 eyeD3 ffmpeg2theora yamdi zip unzip 
python2.6 python­reportlab python­psycopg2 atomicparsley</span></code></span><span>&nbsp;</span></p><p><span>&nbsp;</span>Un certain nombre sont inclus par défaut dans la distribution :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ yum install vorbis­tools libavcodec­extra­53 zip unzip </pre></td></tr></tbody></table><p>D'autres non, il convient donc de les installer comme suit.</p><h4>Ajoût du RPMforge</h4><p>Documentation : <a href="http://repoforge.org/use/" data-mce-href="http://repoforge.org/use/">http://repoforge.org/use/</a><br data-mce-bogus="1"></p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ rpm -Uhv http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm</pre></td></tr></tbody></table><h4>Install lame</h4><p>Documentation : <a href="http://lame.cvs.sourceforge.net/viewvc/lame/lame/USAGE" data-mce-href="http://lame.cvs.sourceforge.net/viewvc/lame/lame/USAGE">http://lame.cvs.sourceforge.net/viewvc/lame/lame/USAGE</a><br data-mce-bogus="1"></p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ yum install ffmpeg</pre></td></tr></tbody></table><p>Test</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ wget http://www.villagegeek.com/downloads/webwavs/adios.wav
$ lame -b128 adios.wav adios.mp3

LAME 3.99.5 64bits (http://lame.sf.net)
polyphase lowpass filter disabled
Encoding adios.wav to adios.mp3
Encoding as 11.025 kHz single-ch MPEG-2.5 Layer III (1.4x)  64 kbps qval=3
    Frame          |  CPU time/estim | REAL time/estim | play/CPU |    ETA 
    65/65    (100%)|    0:00/    0:00|    0:00/    0:00|   113.20x|    0:00 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   kbps       mono %     long switch short %
   64.0      100.0        80.0  12.3   7.7
Writing LAME Tag...done
ReplayGain: -5.1dB</pre></td></tr></tbody></table><h4>Install ffmpeg</h4><p>Documentation : <a href="http://www.ffmpeg.org/ffmpeg.html" data-mce-href="http://www.ffmpeg.org/ffmpeg.html">http://www.ffmpeg.org/ffmpeg.html</a><br data-mce-bogus="1"></p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ yum install ffmpeg</pre></td></tr></tbody></table><p>Test</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ wget http://mirrorblender.top-ix.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_surround.avi
$ ffmpeg -i big_buck_bunny_720p_surround.avi -acodec aac -ab 128kb -strict experimental -vcodec mpeg4 -b 1200kb -mbd 2 -cmp 2 -subcmp 2 -s 320x180 final_video.mp4</pre></td></tr></tbody></table><h4>Install eyeD3</h4><p>Documentation : <a href="http://eyed3.nicfit.net/#documentation-index" data-mce-href="http://eyed3.nicfit.net/#documentation-index">http://eyed3.nicfit.net/#documentation-index</a><br data-mce-bogus="1"></p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ yum install python-eyed3.noarch</pre></td></tr></tbody></table><p>Test</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>// Avant : afficher métadonnées du fichier
$ eyeD3 adios.mp3

eyed3.plugins:WARNING: Plugin '('statistics.py', '/usr/lib/python2.6/site-packages/eyed3/plugins')' requires packages that are not installed: cannot import name Counter
adios.mp3    [ 26.94 KB ]
-------------------------------------------------------------------------------
Time: 00:03    MPEG2, Layer III    [ 64 kb/s @ 11025 Hz - Mono ]
-------------------------------------------------------------------------------
No ID3 v1.x/v2.x tag found!

// affectation de métadonnées
$ eyeD3 -a MonArtiste -A "MonAlbum" -t "MonMorceau" -n 4 adios.mp3

// résultat :
eyed3.plugins:WARNING: Plugin '('statistics.py', '/usr/lib/python2.6/site-packages/eyed3/plugins')' requires packages that are not installed: cannot import name Counter
adios.mp3    [ 28.03 KB ]
-------------------------------------------------------------------------------
Setting artist: MonArtiste
Setting album: MonAlbum
Setting title: MonMorceau
Time: 00:03    MPEG2, Layer III    [ 64 kb/s @ 11025 Hz - Mono ]
-------------------------------------------------------------------------------
ID3 v2.4:
title: MonMorceau
artist: MonArtiste
album: MonAlbum
track: 4        
Writing ID3 version v2.4
-------------------------------------------------------------------------------</pre></td></tr></tbody></table><h4>Install ffmpeg2theora</h4><p>Documentation : <a href="http://v2v.cc/%7Ej/ffmpeg2theora/examples.html" data-mce-href="http://v2v.cc/~j/ffmpeg2theora/examples.html">http://v2v.cc/~j/ffmpeg2theora/examples.html</a><br data-mce-bogus="1"></p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ wget http://v2v.cc/~j/ffmpeg2theora/ffmpeg2theora-0.29.linux64.bin
$ install -m 755 ffmpeg2theora-0.29.linux64.bin /usr/local/bin/ffmpeg2theora</pre></td></tr></tbody></table><p>Test</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ wget http://sourceforge.net/projects/libdv/files/examples/examples/pond.dv/download
$ ffmpeg2theora pond.dv

[dv @ 0x2d84b20] Estimating duration from bitrate, this may be inaccurate
Input #0, dv, from 'pond.dv':
  Duration: 00:00:30.53, start: 0.000000, bitrate: 28771 kb/s
    Stream #0:0: Video: dvvideo, yuv411p, 720x480 [SAR 8:9 DAR 4:3], 28771 kb/s, 29.97 tbr, 29.97 tbn, 29.97 tbc
    Stream #0:1: Audio: pcm_s16le, 44100 Hz, 2 channels, s16, 1411 kb/s
  Pixel Aspect Ratio: 0.89/1   Frame Aspect Ratio: 1.33/1
[swscaler @ 0x2db84a0] Warning: data is not aligned! This can lead to a speedloss
  0:00:30.53 audio: 81kbps video: 6975kbps, time elapsed: 00:00:40             
  0:00:30.53 audio: 81kbps video: 6975kbps, time elapsed: 00:00:40</pre></td></tr></tbody></table><h4>Install yamdi</h4><p>Documentation : <a href="http://yamdi.sourceforge.net/" data-mce-href="http://yamdi.sourceforge.net/">http://yamdi.sourceforge.net/</a><br data-mce-bogus="1"></p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ yum install yamdi</pre></td></tr></tbody></table><p>Test</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ wget http://developer.longtailvideo.com/trac/export/944/trunk/html5/test/files/bunny.flv
$ yamdi -i bunny.flv -o bunny_with_metadata.flv - "John Doe</pre></td></tr></tbody></table><h4>Install <code class="php plain">gcc-c++</code></h4><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ yum install gcc-c++
</pre></td></tr></tbody></table><h4>Install atomicparsley</h4><p>Documentation : <a href="http://atomicparsley.sourceforge.net/" data-mce-href="http://atomicparsley.sourceforge.net/">http://atomicparsley.sourceforge.net/</a> &amp; <a href="https://bitbucket.org/wez/atomicparsley" data-mce-href="https://bitbucket.org/wez/atomicparsley">https://bitbucket.org/wez/atomicparsley</a><br data-mce-bogus="1"></p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ wget https://bitbucket.org/wez/atomicparsley/get/9183fff907bf.zip
$ unzip 9183fff907bf.zip
$ cd wez-atomicparsley-9183fff907bf/
$ sudo yum install automake
</pre></td></tr></tbody></table><p>Test</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>???</pre></td></tr></tbody></table><h3>c. Modification des presets ipod</h3><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ sed -i 's/^profile/vprofile/' /usr/share/ffmpeg/libx264-ipod320.ffpreset
$ sed -i 's/^profile/vprofile/' /usr/share/ffmpeg/libx264-ipod640.ffpreset</pre></td></tr></tbody></table><h2>2. Paramétrage du ftp</h2><h3>Créer un répertoire à la racine du serveur :</h3><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ mkdir /audiovideocours</pre></td></tr></tbody></table><h3>Ajouter un nouvel utilisateur du système « ftpuser »:</h3><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ useradd -m -d /audiovideocours/ftp ftpuser
$ passwd ftpuser</pre></td></tr></tbody></table><h3>Des sous-répertoires doivent également être présents dans le répertoire FTP:</h3><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ mkdir -p /audiovideocours/ftp/canceled /audiovideocours/ftp/client_update /audiovideocours/ftp/live /audiovideocours/ftp/releases</pre></td></tr></tbody></table><ul><li>canceled : sert à stocker les cours enregistrés par le client mais annulés avant la publication.</li><li>client_update
 : permet de stocker la dernière version du client d'enregistrement des 
cours, afin qu'il se mette à jour automatiquement dans les amphis.</li><li>live : est le répertoire de stockage des diapositives d'un cours en direct envoyées par FTP.</li><li>releases : stocke les programmes d'installation du client AudioVideoCast.</li></ul><h3>Modifier les lignes de&nbsp;/etc/vsftpd/vsftpd.conf :</h3><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
chroot_local_user=YES
local_root=/audiovideocours/ftp</pre></td></tr></tbody></table><p>Redémarrez le serveur FTP :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ service vsftpd restart</pre></td></tr></tbody></table><h2>3. Récupération des sources</h2><p>Vous aurez besoin d'utiliser git pour récupérer les dernières sources stables du projet via la commande :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ git clone https://github.com/unistra/avc-server.git univ-r_av &amp;&amp; cd univ-r_av &amp;&amp; git checkout release-2.54 &amp;&amp; cd ..</pre></td></tr></tbody></table><p>L'utilisation de Git ayant échouée (erreur type&nbsp; "<a class="question-hyperlink" href="http://stackoverflow.com/questions/8329485/git-clone-fatal-unable-to-find-remote-helper-for-https" data-mce-href="http://stackoverflow.com/questions/8329485/git-clone-fatal-unable-to-find-remote-helper-for-https">Unable to find remote helper for 'https'</a>"), nous avons récupéré l'archive zip sur GitHub à l'adresse <a href="https://github.com/unistra/avc-server/archive/master.zip" data-mce-href="https://github.com/unistra/avc-server/archive/master.zip">https://github.com/unistra/avc-server/archive/master.zip</a> :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ wget https://github.com/unistra/avc-server/archive/master.zip
$ unzip master.zip
$ mv master avc-server-master</pre></td></tr></tbody></table><p>Il vous 
faut également récupérer le player flash JW player, en acceptant la 
licence « Creative Commons : Attribution-Noncommercial-Share Alike 3.0 
Unported » (voir <a href="http://creativecommons.org/licenses/by-nc-sa/3.0/" data-mce-href="http://creativecommons.org/licenses/by-nc-sa/3.0/">http://creativecommons.org/licenses/by-nc-sa/3.0/</a>) :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ wget http://audiovideocast.unistra.fr/releases/player.swf
$ mv player.swf /usr/local/share/applications/avc-server-master/WebContent/files/jwflvplayer/</pre></td></tr></tbody></table><h2>4. Création de la base de données</h2><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e3RpcH0&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="tip" data-macro-body-type="RICH_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e3RpcH0&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><p>Pour déterminer si votre CentOS est en 32-bit ou 64-bit : tappez</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ uname -a</pre></td></tr></tbody></table><p>Si le résultat contient i686 ou i386, votre CentOS est en 32-bit.</p><p>Si le résultat contient x86_64, votre CentOS est en 64-bit.</p>&nbsp;</td></tr></tbody></table><p>Installation de PostGreSQL :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ yum install postgresql-server.x86_64</pre></td></tr></tbody></table><p>Initialisation de la base de données :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ /etc/init.d/postgresql initdb
Initialisation de la base de données : 
                                                           [  OK  ]</pre></td></tr></tbody></table><p>Démarrage de la base de données :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ service postgresql start
Starting postgresql service:                               [  OK  ]</pre></td></tr></tbody></table><p>Mise en place de l'autostart en cas de reboot :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ chkconfig postgresql on</pre></td></tr></tbody></table><p>Rappel des commandes de base pour postgresql :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ postgres=# help
Vous utilisez psql, l'interface en ligne de commande de PostgreSQL.
Saisissez:
    \copyright pour les termes de distribution
    \h pour l'aide-mémoire des commandes SQL
    \? pour l'aide-mémoire des commandes psql
    \g ou point-virgule en fin d'instruction pour exécuter la requête
    \q pour quitter</pre></td></tr></tbody></table><p>Création d'un utilisateur "sqluser"</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ su - postgres --command="createuser -P sqluser"
Enter password for new role: 
Enter it again: 
Shall the new role be a superuser? (y/n) n
Shall the new role be allowed to create databases? (y/n) n
Shall the new role be allowed to create more new roles? (y/n) n</pre></td></tr></tbody></table><p>Création d'une base de données "univrav" en utf-8 pour cet utilisateur :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ su - postgres --command="createdb -O sqluser -E UTF8 univrav"</pre></td></tr></tbody></table><p>Lancer le script de création de la base se trouvant dans le répertoire des sources :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ psql -h localhost -U sqluser -W -d univrav &lt; /tmp/avc-server-master/WebContent/scripts/script_creation_database.sql</pre></td></tr></tbody></table><p><br></p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e25vdGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="note" data-macro-body-type="RICH_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e25vdGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><p>Si
 une erreur "psql: FATAL:&nbsp; Ident authentication failed for user ..." est
 retournée, éditez le fichier "pg_hba.conf" comme suit en gardant une 
copie de sauvegarde :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ cp /var/lib/pgsql/data/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf.back
$ vi /var/lib/pgsql/data/pg_hba.conf</pre></td></tr></tbody></table><p>Avant :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre># TYPE  DATABASE    USER        CIDR-ADDRESS          METHOD
# "local" is for Unix domain socket connections only
local   all         all                               ident
# IPv4 local connections:
host    all         all         127.0.0.1/32          ident
# IPv6 local connections:
host    all         all         ::1/128               ident</pre></td></tr></tbody></table><p>Après :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre># TYPE  DATABASE    USER        CIDR-ADDRESS          METHOD
# "local" is for Unix domain socket connections only
local   all         all                               password
# IPv4 local connections:
host    all         all         127.0.0.1/32          password
# IPv6 local connections:
host    all         all         ::1/128               password</pre></td></tr></tbody></table><p>Pour prendre en compte les changements, redémarrez le service :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ sudo service postgresql restart</pre></td></tr></tbody></table><p>pour plus d'infos : <a href="http://www.postgresql.org/docs/8.2/static/auth-pg-hba-conf.html" data-mce-href="http://www.postgresql.org/docs/8.2/static/auth-pg-hba-conf.html">http://www.postgresql.org/docs/8.2/static/auth-pg-hba-conf.html</a><br data-mce-bogus="1"></p></td></tr></tbody></table><p>Vérifier que les tables ont bien été créées :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>// connexion à la base
$ psql -h localhost -d univrav -U sqluser -W
// lister les tables
univrav=&gt; \dt
               Liste des relations
 Schéma |       Nom       | Type  | Propriétaire 
--------+-----------------+-------+--------------
 public | amphi           | table | sqluser
 public | building        | table | sqluser
 public | course          | table | sqluser
 public | discipline      | table | sqluser
 public | job             | table | sqluser
 public | level           | table | sqluser
 public | log_user_action | table | sqluser
 public | selection       | table | sqluser
 public | slide           | table | sqluser
 public | tag             | table | sqluser
 public | user            | table | sqluser
(11 lignes)</pre></td></tr></tbody></table><h2>5. Configuration de tomcat</h2><p>Ajouter les librairies suivantes dans le répertoire <code>/usr/share/tomcat6/lib</code> :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ ln -s /usr/share/java/commons-beanutils-1.9.1.jar /usr/share/tomcat6/lib/commons-beanutils.jar
$ ln -s /usr/share/java/commons-collections-3.2.1.jar /usr/share/tomcat6/lib/commons-collections3.jar
$ ln -s /usr/share/java/commons-collections.jar /usr/share/tomcat6/lib/commons-collections.jar
$ ln -s /usr/share/java/commons-dbcp.jar /usr/share/tomcat6/lib/commons-dbcp.jar
$ ln -s /usr/share/java/commons-fileupload-1.3.1.jar /usr/share/tomcat6/lib/commons-fileupload.jar
$ ln -s /usr/share/java/commons-io-2.4.jar /usr/share/tomcat6/lib/commons-io.jar
$ ln -s /usr/share/java/commons-lang-2.6.jar /usr/share/tomcat6/lib/commons-lang.jar
$ ln -s /usr/share/java/commons-logging.jar /usr/share/tomcat6/lib/commons-logging.jar
$ ln -s /usr/share/java/commons-pool.jar /usr/share/tomcat6/lib/commons-pool.jar
$ ln -s /usr/share/java/postgresql-jdbc3.jar /usr/share/tomcat6/lib/postgresql-jdbc3.jar
$ ln -s /usr/share/java/log4j-1.2.14.jar /usr/share/tomcat6/lib/log4j1.2.jar</pre></td></tr></tbody></table><p><br></p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e25vdGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="note" data-macro-body-type="RICH_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e25vdGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><p>Il peut être nécessaire d'installer les librairies Apache Commons à la main au préalable :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>yum install tomcat6-admin-webapps.noarch
yum install tomcat6-webapps.noarch

wget http://apache.crihan.fr/dist//commons/fileupload/binaries/commons-fileupload-1.3.1-bin.tar.gz
wget http://mirrors.ircam.fr/pub/apache//commons/lang/binaries/commons-lang3-3.3.2-bin.tar.gz
wget http://mirrors.ircam.fr/pub/apache//commons/io/binaries/commons-io-2.4-bin.tar.gz
wget http://apache.websitebeheerjd.nl//commons/collections/binaries/commons-collections-3.2.1-bin.tar.gz
wget http://apache.lehtivihrea.org//commons/beanutils/binaries/commons-beanutils-1.9.1-bin.tar.gz
for fichier in $(ls commons*gz); do tar -xzvf $fichier; done
mv commons-*/{lib/,}*jar /usr/share/java/

# vérif : 

find / -name "commons-*"

yum install postgresql-jdbc.noarch

# vérif : 

find / -name "postgresql-jdbc*"</pre></td></tr></tbody></table><p><br></p></td></tr></tbody></table><h3>Configuration du tomcat-users.xml</h3><p>Création d'un utilisateur tomcat <code>ulpmm</code> de la manière suivante :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ cd /usr/share/tomcat6/conf/
$ sudo cp tomcat-users.xml tomcat-users.xml.back
$ sudo vi tomcat-users.xml</pre></td></tr></tbody></table><p>Contenu :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>&lt;tomcat-users&gt;
  &lt;role rolename="tomcat"/&gt;
  &lt;role rolename="manager"/&gt;
  &lt;role rolename="ulpmm"/&gt;
  &lt;user username="ulpmm" password="s3cret" roles="tomcat,manager,ulpmm"/&gt;
&lt;/tomcat-users&gt;</pre></td></tr></tbody></table><p>Note: le rôle <code>ulpmm</code> est nécessaire pour accéder aux pages d’administration d'AudioVideoCast.</p><h3>Configuration du server.xml :</h3><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ cd /usr/share/tomcat6/conf/
// copie de sauvegarde
$ cp server.xml server.xml.back

</pre></td></tr></tbody></table><p>Parties du fichier à modifier :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>// configuration du fichier server.xml
&lt;Connector port="8080" protocol="HTTP/1.1"
	connectionTimeout="20000"
	redirectPort="443" /&gt;</pre></td></tr></tbody></table><p>Mise en place du certificat pour Tomcat</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>&lt;Connector port="8443" protocol="HTTP/1.1" SSLEnabled="true"
maxThreads="150" scheme="https" secure="true"
clientAuth="false" sslProtocol="TLS"
keystoreFile="/etc/tomcat6/tomcatkeystore.jks" keystorePass="********" /&gt;</pre></td></tr></tbody></table><p><br></p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>&lt;!Define an AJP 1.3 Connector on port 8009 &gt;
	&lt;Connector port="8009" protocol="AJP/1.3" redirectPort="443" /&gt;</pre></td></tr></tbody></table><p><br></p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>&lt;Host name="localhost" appBase="webapps" unpackWARs="true" autoDeploy="true"
	xmlValidation="false" xmlNamespaceAware="false"&gt;
	&lt;Context path="" docBase="univr_av"&gt; &lt;!-- laisser vide le contexte path pour accéder au portail avec une adresse du type http://mon-domaine.fr --&gt;
		&lt;Environment name="volume" value="1" type="java.lang.Short" override="false"/&gt;
			&lt;Resource
				name="jdbc/postgres"
				auth="Container"
				type="javax.sql.DataSource"
				driverClassName="org.postgresql.Driver"
				url="jdbc:postgresql://127.0.0.1:5432/univrav"
				username="sqluser"
				password="*******"
				maxActive="20"
				maxIdle="10"
				maxWait="1"
			/&gt;
			&lt;Resource name="ldap/ox" auth="Container"
				type="com.sun.jndi.ldap.LdapCtx"
				factory="org.ulpmm.univrav.dao.LdapFactory"
				java.naming.factory.initial="com.sun.jndi.ldap.LdapCtxFactory"
				java.naming.provider.url="your_ldap_url"
				java.naming.security.authentication="simple"
				java.naming.security.principal="ldap_user"
				java.naming.security.credentials="ldap_password"
				com.sun.jndi.ldap.connect.pool="true"
				java.naming.security.protocol="ssl"
				com.sun.jndi.ldap.connect.timeout="5000"
				com.sun.jndi.ldap.read.timeout="5000"/&gt;
	&lt;/Context&gt;
&lt;/Host&gt;</pre></td></tr></tbody></table><h3>Configuration des policies :</h3><p>Attention : certaines versions de tomcat sont plus stricte que d'autres d'un point devu sécurité au niveau des policies.</p><p>En cas d'erreur provenant de « java.security », il faut :</p><ul><li>Soit désactiver le « security manager » dans<code> /etc/init.d/tomcat6: TOMCAT6_SECURITY=no</code></li><li>Soit configurer les policies du répertoire <code>/etc/tomcat6/policy.d/</code></li></ul><p>Après avoir effectuées toutes les modifications ci-dessus, redémarrer tomcat via :</p><p><code>/etc/init.d/tomcat6 restart</code></p><h2>6. Stockage des répertoires de cours</h2><p>Créer un répertoire <code>/audiovideocours/cours</code> :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>mkdir /audiovideocours/cours</pre></td></tr></tbody></table><p>Ce répertoire permet de stocker les cours.</p><p>Il
 contient un répertoire (par défaut 1) appelé « volume de stockage ». Il
 est possible de modifier la valeur du volume dans le contexte de 
tomcat, si l'on veut monter un nouveau filesystem (pour raison de place 
par exemple).</p><p>Chaque cours se trouve dans une arborescence de sous-répertoires basée sur l'id du cours (formaté sur 8 chiffres).</p><p>Par exemple, pour le cours n°4209,l'arborescence sera :</p><p><code>/audiovideocours/cours/1/00/00/42/09</code></p><p>On donne les droits d'écriture à l'ensemble du répertoire <code>/audiovideocours</code> :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>chmod -R 777 /audiovideocours</pre></td></tr></tbody></table><h2>7. Déploiement de l'application AudioVideoCast :</h2><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e3RpcH0&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="tip" data-macro-body-type="RICH_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e3RpcH0&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><p>Vérifiez que Ant soit installé sur votre serveur :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ yum install ant</pre></td></tr></tbody></table><p><br></p></td></tr></tbody></table><p>Pour créer un fichier .war de l’application, il suffit d'utiliser le fichier <code>build.xml</code>, qui est à la racine du projet, avec ANT :</p><ul><li>Configurer l'application par le fichier <code>univrav.properties</code> dans le répertoire <code>WebContent/conf</code> des sources <br>et par le fichier <code>WebContent/WEBINF/web.xml</code> (voir Annexe).</li><li>Génération
 du .war de l'application via les sources récupérées du SVN, en 
éxecutant la commande suivante à la racine du projet : <code>ant</code><ul><li><p>En cas de problème dans Application.java &gt; erreur : "package org.apache.commons.lang does not exist "</p><ol><li><p>éditer fichier Application : <code>vi /usr/local/share/applications/avc-server-master/src/org/ulpmm/univrav/web/Application.java</code></p></li><li><p>changer classe commons-lang chargée : <code>import org.apache.commons.lang3.text.WordUtils</code>;</p></li><li><p>mettre en commentaire ligne 47 : <code>import org.apache.commons.lang.WordUtils;</code></p></li></ol></li><li>En cas d'erreur : "the class org.apache.tools.ant.taskdefs.optional.junit.JUnitTask was not found"<ol><li><p>installer junit : <code>sudo yum install ant-junit.x86_64</code></p></li></ol></li><li><p>Génération du war :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ ant
Buildfile: build.xml
prep:
init:
compile:
     [echo] Compilation des sources
test:
makeWar:
     [echo] Création de l'archive univ-r_av.war dans /root/dev/war
      [war] Building war: /root/dev/war/univ-r_av.war
BUILD SUCCESSFUL
Total time: 1 second</pre></td></tr></tbody></table><p><br></p></li></ul></li><li><p>Déploiement du .war sur Tomcat (url : <a href="http://localhost:8180/manager/html" data-mce-href="http://localhost:8180/manager/html">http://localhost:8180/manager/html</a>)</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ cp /root/dev/war/univ-r_av.war /usr/share/tomcat6/webapps/univ-r_av.war
$ service tomcat6 restart</pre></td></tr></tbody></table><p><br></p></li></ul><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e3dhcm5pbmd9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="warning" data-macro-body-type="RICH_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e3dhcm5pbmd9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><p>Attention
 : il est préférable de supprimer le cache de Tomcat lors de son 
redémarrage car il peut y avoir des problèmes de rafraîchissement de 
pages lorsqu'une nouvelle version est mise en place.</p></td></tr></tbody></table><p>Accéder à l'application via <a href="http://localhost/univ-r_av" data-mce-href="http://localhost/univ-r_av">http://localhost/univ-r_av</a> ou via l'url apache que vous avez configurée : <a href="http://avcast-test.univ-lyon2.fr:8080/univ-r_av/" data-mce-href="http://avcast-test.univ-lyon2.fr:8080/univ-r_av/">http://avcast-test.univ-lyon2.fr:8080/univ-r_av/</a>&nbsp;</p><h2>8. Configuration APACHE</h2><h3>a. Installation des modules</h3><p>Les modules qui doivent être installés sont :<code> proxy proxy_ajp proxy_balancer proxy_http rewrite ssl</code></p><p>La plupart sont installés par défaut sur RHEL6. Le seul manquant est le module SSL.</p><p>Pour le vérifier :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ grep -E 'rewrite|proxy|ssl' /etc/httpd/conf{.d,}/*.conf | grep LoadModule
/etc/httpd/conf/httpd.conf:LoadModule rewrite_module modules/mod_rewrite.so
/etc/httpd/conf/httpd.conf:LoadModule proxy_module modules/mod_proxy.so
/etc/httpd/conf/httpd.conf:LoadModule proxy_balancer_module modules/mod_proxy_balancer.so
/etc/httpd/conf/httpd.conf:LoadModule proxy_ftp_module modules/mod_proxy_ftp.so
/etc/httpd/conf/httpd.conf:LoadModule proxy_http_module modules/mod_proxy_http.so
/etc/httpd/conf/httpd.conf:LoadModule proxy_ajp_module modules/mod_proxy_ajp.so
/etc/httpd/conf/httpd.conf:LoadModule proxy_connect_module modules/mod_proxy_connect.so</pre></td></tr></tbody></table><p>Le seul module manquant est mod_ssl.</p><p>Pour l'installer :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ yum install mod_ssl.x86_64</pre></td></tr></tbody></table><h3>b. Configuration d'apache</h3><p>Il faut créer un fichier <code>monsite.conf</code> dans le répertoire<code> /etc/httpd/conf.d/</code> qui doit contenir les hôtes virtuels pour le site web (un sur le port 80 et un sur le port SSL 443).</p><p>Il faut alors monter le dossier racine afin d'avoir accès à l'arborescence du site, le dossier <code>/audiovideocours/cours/</code> pour pouvoir accéder aux cours depuis l'extérieur, les dossiers <code>/audiovideocours/ftp/live/</code> et <code>/audiovideocours/ftp/releases</code> mettant à disposition des fichiers via FTP.</p><p>Pour
 SSL, il faut créer un certificat et l'activer depuis l'hôte virtuel 
443. Puis, depuis l'hôte virtuel 80, on redirige les URLs que l'on 
désire sécuriser vers le port 443, via le mode rewrite.</p><p>// création des fichiers mon-site.conf et mon-site.include</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ cd /etc/httpd/conf.d/
$ touch avcast-test.conf
$ touch avcast-test.include
</pre></td></tr></tbody></table><p>// Fichier mon-site.conf</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>&lt;VirtualHost *:80&gt;
        ServerName mon-site
        ServerAlias mon-site-alias
        RewriteEngine On
        RewriteCond %{HTTPS} off
        RewriteRule ^(.*)/avc/myspace(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
		#RewriteRule ^(.*)/avc/myspace(.*)$ https://avcast-test.univ-lyon2.fr/avc/myspace_home [R=301,L]
        RewriteRule ^(.*)/admin(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
        RewriteRule ^(.*)/avc/admin(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
        RewriteRule ^(.*)/avc/publication(.*)$ https://%{HTTP_HOST}%{REQUEST_URI}[R=301,L]
        RewriteRule ^(.*)/avc/authentification(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
		#RewriteRule ^(.*)/avc/authentification(.*)$ https://avcast-test.univ-lyon2.fr/avc/myspace_home [R=301,L]
        Include /etc/httpd/conf.d/mon-site.include
&lt;/VirtualHost&gt;

&lt;VirtualHost *:443&gt;
		ServerName mon-site
		ServerAlias mon-site
		SSLEngine On
		SSLCipherSuite (ici les algorithmes de chiffrement générés)
		SSLCertificateFile /etc/pki/tls/certs/mon-site.crt
		SSLCertificateKeyFile /etc/pki/tls/private/mon-site.key
		SSLCertificateChainFile /etc/pki/tls/certs/mon-site.crt
		Include /etc/httpd/conf.d/mon-site.include
		RewriteEngine On
		RewriteCond %{HTTPS} on
		RewriteRule ^(.*)/avc/courseaccess(.*)$ http://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
		RewriteRule ^(.*)/avc/liveaccess(.*)$ http://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
&lt;/VirtualHost&gt;</pre></td></tr></tbody></table><p>// Fichier mon-site.conf</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>ServerAdmin webmaster@localhost

DocumentRoot /var/lib/tomcat6/webapps/univ-r_av
Options -Indexes

&lt;Proxy *&gt;
 Allow from all
&lt;/Proxy&gt;

&lt;Proxy balancer://tomcat/univ-r_av&gt;
     BalancerMember ajp://127.0.0.1:8009 route=localhost connectiontimeout=1000
&lt;/Proxy&gt;

ProxyPass /coursv2 !
Alias /coursv2 "/audiovideocours/cours/"

ProxyPass /live !
Alias /live "/audiovideocours/ftp/live/"

ProxyPass /releases !
Alias /releases "/audiovideocours/ftp/releases/"

ProxyPass /balancer-manager !
&lt;Location /balancer-manager&gt;
     SetHandler balancer-manager
     Order Deny,Allow
     Deny from all
     Allow from 127.0.0.1
&lt;/Location&gt;

ProxyPass / balancer://tomcat/ stickysession=JSESSIONID|jsessionid
ProxyPassReverse / balancer://tomcat/ stickysession=JSESSIONID|jsessionid

ErrorLog /var/log/httpd/error-univ-rav.log
LogLevel warn
CustomLog /var/log/httpd/access-univ-rav.log combined</pre></td></tr></tbody></table><p>Il faut, après tout changement au niveau de l'un de ces fichiers, redémarrer Apache :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>$ service httpd restart</pre></td></tr></tbody></table><h3>c. Connexion avec un sous-répertoire : http://avcast-test.univ-lyon2.fr/<code>univ-r_av</code>/</h3><p>Modification du fichier <code>/usr/share/tomcat6/conf/server.xml</code> pour faire pointer la racine non plus sur le serveur Tomcat mais sur un sous-répertoire :</p><p><code>&lt;Context path="univ-r_av" docBase="univ-r_av"&gt;</code> puis restart Tomcat</p><p>Le site est donc accessible à l'adresse : <code><span class="nolink">http://avcast-test.univ-lyon2.fr</span>/univ-r_av/</code></p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e25vdGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="note" data-macro-body-type="RICH_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e25vdGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><p>Il convient de vérifier toutes les URLs d'accès, notamment dans le fichier <code>univrav.properties</code>.</p></td></tr></tbody></table><h2>9. Activation du streaming</h2><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e3dhcm5pbmd9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="warning" data-macro-body-type="RICH_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e3dhcm5pbmd9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body">Partie à venir</td></tr></tbody></table><h2>10. Séparer l'encodage des médias</h2><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e3dhcm5pbmd9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="warning" data-macro-body-type="RICH_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e3dhcm5pbmd9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body">Partie à venir</td></tr></tbody></table><h2>11. Suppression des tests</h2><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e3dhcm5pbmd9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="warning" data-macro-body-type="RICH_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e3dhcm5pbmd9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body">Partie à venir</td></tr></tbody></table><h2>12. Configuration du live</h2><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e3dhcm5pbmd9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="warning" data-macro-body-type="RICH_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e3dhcm5pbmd9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body">Partie à venir</td></tr></tbody></table><h2>13. Page d'administration</h2><p>La page d'administration permet de gérer différents éléments du site : <code>http://mon-site/admin</code></p><ol><li>Gestion des cours (éditer, supprimer)</li><li>Gestion des cours Univ-r (éditer, supprimer)</li><li>Gestion des bâtiments et des salles (ajouter, éditer, supprimer)</li><li>Gestion des utilisateurs (ajouter, éditer, supprimer)</li><li>Statistiques sur les auteurs</li><li>Statistiques générales (taille du disque, commande findTracks et findStats, version des clients)</li><li><p><em>Page dédié aux tests (code d'accès spécifiques modifiables dans le fichier « <code>univrav.properties</code> » via « <code>testKeyWord</code> ») : <code><span class="nolink">http://mon-site/tests</span></code></em></p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e3dhcm5pbmd9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="warning" data-macro-body-type="RICH_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e3dhcm5pbmd9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><p>Cette partie là ne fonctionne pas dans la configuration déployée chez nous.</p></td></tr></tbody></table><p><br></p></li><li><p>Gestion des sélections et des collections de cours</p></li><li>Test des versions des clients des amphithéâtres</li></ol><p>NB: Pour les statistiques, il y a la possibilité d'utiliser google analytics (voir fichier «<code> WEB-INF/views/include/google_analytics.jsp</code> » pour y coller votre script ga)</p><h2>14. Annexes</h2><h3>a. Personnalisation de l'interface</h3><p>Fichier master : <code>/usr/local/share/applications/avc-server-master/WebContent/WEB-INF/views/include/footer.jsp</code></p><p>Ligne 14 modifiée :</p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGU6Zmlyc3RsaW5lPTE0fQ&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-parameters="firstline=14" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGU6Zmlyc3RsaW5lPTE0fQ&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>      &lt;a href="mailto:nicolas.truchaud@univ-lyon2.fr"&gt;&lt;fmt:message key="Assistance"/&gt;&lt;/a&gt; - &lt;a href="mailto:nicolas.truchaud@univ-lyon2.fr.fr"&gt;&lt;fmt:message key="Contact"/&gt;&lt;/a&gt; - &lt;a href="&lt;c:out value="${thick_legal}" /&gt;" title="&lt;fmt:message key="Informations l&amp;eacute;gales"/&gt;" class="thickbox"&gt;&lt;fmt:message key="Informations l&amp;eacute;gales"/&gt;&lt;/a&gt;
</pre></td></tr></tbody></table><p>Emplacement final : <code>/usr/share/tomcat6/webapps/univ-r_av/WEB-INF/views/include/</code></p><h3>b. Détail du fichier "univrav.properties"</h3><p>Chemin d'accès au fichier :&nbsp;<code>/usr/share/tomcat6/webapps/univ-r_av/conf/univrav.properties</code></p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre># The Url of the server
serverUrl = http://localhost/univ-r_av
## Il s'agit de l'url du serveur. Elle doit être changée.

# The Url to access to the course on internet Prod : http://[HOSTNAME].u-strasbg.fr/
coursesUrl = http://avcast-test.univ-lyon2.fr/coursv2/
# Il s'agit de l'url permettant d'accéder aux enregistrements. Elle doit être changée. Il est possible d'utiliser une fonction RAND[110] pour faire du load balancing sur plusieurs serveurs. Ex: streamRAND[1-10].example.fr va load balancer sur stream1,stream2,...,stream10. Il est également possible d'utiliser une fonction [HOSTNAME] pour récupérer le nom du serveur.

# Folders on the file system Prod : /audiovideocours/cours/ /audiovideocours/ftp/ /audiovideocours/ftp/live/
coursesFolder = /audiovideocours/cours/
# Dossier contenant les cours de l'application.
ftpFolder = /audiovideocours/ftp/
# Dossier contenant les cours zippés envoyés par le client.
liveFolder = /audiovideocours/ftp/live/
# Dossier servant à recevoir la capture d'écran envoyé par le client pendant le Live.

# Default media filenames in the archive sent by the client
defaultMp3File = enregistrement-micro.mp3
defaultFlashFile = enregistrement-video.flv
defaultMp4File = enregistrement-video.mp4
defaultAudioMacFile1 = enregistrement-micro.flv
defaultAudioMacFile2 = enregistrement-micro.aac
# Ces paramètres ne doivent pas être changés pour le bon fonctionnement avec le client actuel.

# Copyright comment
comment = Owned by the author
# Commentaire pour les tags des médias.

# IP address of the Flash Server for the video and audio live
flashServerIp = vod-flash-avc.univ-lyon2.fr
# Adresse du serveur flash pour la diffusion en live. Doit être changée.

# The settings of the RSS files, of the permalien (interface flash) and of emails
rssTitle = AudioVideoCast
rssName = AudioVideoCast
rssDescription = Universit? Lyon 2
rssImageUrl = http://avcast-test.univ-lyon2.fr/univ-r_av/files/img/univr-av-logo-rss.png
rssCategory = Enseignement
language = fr
# Paramètres pour les flux RSS. Peut être changé.
recordedInterfaceUrl = http://avcast-test.univ-lyon2.fr/univ-r_av/avc/courseaccess
# Lien utilisé pour les accès directs aux enregistrements. Doit être changé.

# The setting of the RSS files for iTunes
itunesAuthor = Universit? Lyon 2
itunesSubtitle = Enregistrement culturel
itunesSummary = Retrouvez les supports synchronis?s sur avcast-test.univ-lyon2.fr
itunesImage = http://avcast-test.univ-lyon2.fr/releases/Illustration_itunes_AVC.jpg
itunesCategory = Enseignement
itunesKeywords = science,culture,soci?t?,technologies,?ducation
# Paramètres pour les flux RSS sous iTunes. Peut être changé.

# University parameters
univName = Universite Lyon 2
univAcronym = UL2
univLink = http://www.univ-lyon2.fr/
# Informations concernant l'université sur la page d'acceuil

# Publication free
pubFree = true
#Publication test
pubTest = true
# Autoriser ou non la publication libre de contenu

# The numbers of courses to display at the same time
lastCourseNumber = 10
selectionCourseNumber = 10
collectionCourseNumber = 10
recordedCourseNumber = 10
# Permet de définir le nombre de cours à afficher dans la page d'accueil et dans la page des enregistrements.

# The default style
defaultStyle = orange-theme
# Thème du site par défaut.

# The keyword to identify the tests to delete (genre is equal to this keyword)
testKeyWord1 = Suppression
# The keyword to identify the tests to hide (title begins with this keyword)
testKeyWord2 = Testul2
# testKeyWord3 = Essai
# Mots clé pour le code d'accès d'un enregistrement permettant de le masquer.

# The client port for the Univ-R integration
#clientSocketPort = 3737

#Admin email for notification (ex: user@domain.fr)
adminEmail1=admin1@fai.fr
adminEmail2=admin2@fai.fr
adminEmail3=admin3@fai.fr
# Adresse email des administrateurs. Doit être changé.

#CAS Logout
casLogoutUrl=https://casl2.univ-lyon2.fr/cas/logout
# Adresse de déconnexion du serveur cas. Doit être changé.

#Additional document formats
addDocFormats=pdf html swf ppt pptx odp docx doc odt xls xlsx ods rtf txt jpg jpeg png gif bmp zip bz bz2 ark rar 7z ac3 avi divx flv m3u m4a mov movie mp2 mp3 mp4 mpg mpeg ogg ra rm rv wav wma wmv aac
# Formats de fichiers autorisés pour l'upload de documents additionnels.

#Upload media formats
uploadFormats=mp3 ogg wav wma avi divx mp4 mpg mpeg mov wmv mkv flv ogv webm m4v
# Formats de fichiers autorisés pour l'upload de fichiers audio et video.

#Link for support (help page)
supportLink=http://dsi.univ-lyon2.fr
helpLink=https://sites.google.com/site/wikiaudiovideocast/
clientLink=https://sites.google.com/site/wikiaudiovideocast/client-logiciel-fr
tracLink=http://sourcesup.cru.fr/projects/audiovideocours
docLink=http://dsi.univ-lyon2.fr/acces-et-utilisation-des-outils-486843.kjsp
# Lien d'aide pour l'application (page help). Peut être changé.

#LDAP search properties
ldapBaseDn=ou=people,dc=univ-lyon2,dc=fr
ldapSearchFilter=uid
ldapMail=mail
ldapFirstname=givenName
ldapLastname=sn
ldapProfile=eduPersonPrimaryAffiliation
ldapAffectation=supannetablissement
ldapEtpPrimaryCode=udsPrimaryEtpCode
ldapPrimaryInstitute=udsMainDepartmentCode
ldapSecondaryInstitute=supannEntiteAffectationPrincipale
# Propriétés de recherche du ldap. À modifier en fonction du ldap.

# To separate medias encodage
sepEnc=false
# Si false, l'application web encode les médias (par défaut). Si true, l'encodage des medias doit se faire séparément (via tâche cron qui appelle les scripts).

# default record interface (flash or html5)
defaultRecordInterface=html5
# html5 ou flash pour l’interface de visualisation par défaut

# Log user action stats
logstats=true
# logger les actions des utilisateurs pour les statistiques

# Google analytics
googleAnalyticsAccount=

# Show Contact Us
contactUs=true

</pre></td></tr></tbody></table><h3>c. Détail du filtre CAS du fichier "web.xml"</h3><p>Chemin d'accès au fichier :&nbsp;<code>/usr/share/tomcat6/webapps/univ-r_av/WEB-INF/web.xml</code></p><table class="wysiwyg-macro" style="background-image: url(/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2); background-repeat: no-repeat;" data-macro-name="code" data-macro-body-type="PLAIN_TEXT" data-mce-style="background-image: url('http://wiki.univ-lyon2.fr/plugins/servlet/confluence/placeholder/macro-heading?definition=e2NvZGV9&amp;locale=fr_FR&amp;version=2'); background-repeat: no-repeat;"><tbody><tr><td class="wysiwyg-macro-body"><pre>    &lt;filter&gt; 
        &lt;filter-name&gt;CAS filter&lt;/filter-name&gt; 
        &lt;filter-class&gt;edu.yale.its.tp.cas.client.filter.CASFilter&lt;/filter-class&gt; 
        &lt;init-param&gt; 
            &lt;param-name&gt;edu.yale.its.tp.cas.client.filter.loginUrl&lt;/param-name&gt; 
            &lt;param-value&gt;https://cas.example.fr:443/cas/login&lt;/param-value&gt;
			Url de login du serveur CAS. À changer.
        &lt;/init-param&gt; 
        &lt;init-param&gt; 
            &lt;param-name&gt;edu.yale.its.tp.cas.client.filter.validateUrl&lt;/param-name&gt; 
            &lt;param-value&gt;https://cas.example.fr:443/cas/serviceValidate&lt;/param-value&gt;
			Url de validation du serveur CAS. À changer.&nbsp;
        &lt;/init-param&gt; 
        &lt;init-param&gt;                     
            &lt;param-name&gt;edu.yale.its.tp.cas.client.filter.serverName&lt;/param-name&gt;                     
            &lt;param-value&gt;localhost&lt;/param-value&gt;
			Url de retour après connexion au serveur CAS. Il s'agit de l'adresse de votre site. À changer.
        &lt;/init-param&gt;
    &lt;/filter&gt;

</pre></td></tr></tbody></table><p><br></p>
