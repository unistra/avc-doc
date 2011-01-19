#!/bin/bash

# $1 is the job id to reencode

if test -z "$1"
then
        echo "CourseID is needed."
        exit
fi

SCRPTH="/XXX/AVC_manualEnctool/jobs_encodage"
AVCURL="http://localhost/univ-r_av"
CRSDIR="/audiovideocours/cours"
WHOAMI=`whoami`
OWNER="tomcat6.tomcat6"
DBPARAM="host='localhost' dbname='univrav' user='sqluser' password='secr3t'"

if [ $WHOAMI = root ];
then
python jobwait.py $1 "$DBPARAM"
bash $SCRPTH/JobEnc.sh $SCRPTH $AVCURL $CRSDIR
chown -R $OWNER $CRSDIR
else
echo "You must be root ! sudo su and relaunch the script"
fi
