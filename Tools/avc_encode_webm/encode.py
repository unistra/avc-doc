# -*- coding: utf-8 -*-

from os.path import exists
import subprocess
import logging
from ConfigParser import SafeConfigParser
import ast
from datetime import datetime
import psycopg2

"""
Script for webm encoding
"""

parser = SafeConfigParser()
parser.read('config.ini')
#logging
filename="%s_%s.log" % (parser.get('logging', 'filename'), datetime.now().strftime("%Y%m%d%H%M"))
logging.basicConfig(filename=filename,level=logging.DEBUG)
#encoding
pthscr=parser.get('encoding', 'pthscr')
home=parser.get('encoding', 'pthcours')
interval = ast.literal_eval(parser.get('encoding', 'interval'))
#database
host=parser.get('database', 'host')
port=parser.get('database', 'port')
dbname=parser.get('database', 'dbname')
user=parser.get('database', 'user')
password=parser.get('database', 'password')
#owner
owner_user=parser.get('owner', 'owner_user')
owner_group=parser.get('owner', 'owner_group')

def getMediaFolder(id):
    """ get the media folder of a course """
    formatid = "%08d" % (int(id),)
    if len(formatid) <=8:
        return "%s/%s/%s/%s" % (formatid[0:2], formatid[2:4],formatid[4:6], formatid[6:8])
    else:
        return id


def encodeVideoslide(folder,courseid):
    """encode videoslide webm if videoslide mp4 exist """
    videoslidemp4 = "%s/%s_videoslide.mp4" % (folder,courseid)
    videoslidewebm = "%s/%s_videoslide.webm" % (folder,courseid)
    # encode if mp4 exist and webm not exist 
    if exists(videoslidemp4) and not exists(videoslidewebm):            
        logging.info("------ start encode videoslide to webm ...")
        # bash $PTHSCR/convertAll2Webm.sh $MediaFolder "$CourseID"_videoslide mp4
        subprocess.call(["bash", "%s/convertAll2Webm.sh" % (pthscr,), folder, "%s_videoslide" % (courseid,), "mp4"])
        logging.info("------ done: %s_videoslide.webm" % (courseid,))
        return True
    else:
        logging.info("------ no videoslide or webm file already exist, skip the encoding of videoslide to webm")
        return False


def encodeVideo(folder,courseid):
    """ encode video webm if video mp4 or flv exist"""
    videomp4 = "%s/%s.mp4" % (folder, courseid)
    videoflv = "%s/%s.flv" % (folder, courseid)
    videowebm = "%s/%s.webm" % (folder, courseid)
    if exists(videomp4) and not exists(videowebm):
        logging.info("------ start encode video mp4 to webm ...")
        # bash $PTHSCR/convertAll2Webm.sh $MediaFolder $CourseID mp4  
        subprocess.call(["bash", "%s/convertAll2Webm.sh" % (pthscr,), folder, courseid, "mp4"])
        logging.info("------ done: %s.webm" % (courseid,))
        return True
    elif exists(videoflv) and not exists(videowebm):
        logging.info("------ start encode video flv to webm ...")
        # bash $PTHSCR/convertAll2Webm.sh $MediaFolder $CourseID flv
        subprocess.call(["bash", "%s/convertAll2Webm.sh" % (pthscr,), folder, courseid, "flv"])
        logging.info("------ done: %s.webm" % (courseid,))
        return True
    else:
        logging.info("------ no video or webm file already exist, skip the encoding of mp4 or flv to webm")
        return False

def encodeAddVideo(folder,courseid):
    """ encode addvideo webm if mp4 exist """
    addvideofolder = "additional_video"
    addvideomp4 = "%s/%s/addvideo_%s.mp4" % (folder,addvideofolder,courseid)
    addvideowebm = "%s/%s/addvideo_%s.webm" % (folder,addvideofolder,courseid)
    if exists(addvideomp4) and not exists(addvideowebm):
        logging.info("------ start encode addvideo mp4 to webm ...")
        # bash $PTHSCR/convertAll2Webm.sh $MediaFolder/$FOLDER $AV$CourseID mp4
        subprocess.call(["bash", "%s/convertAll2Webm.sh" % (pthscr,), "%s/%s" % (folder,addvideofolder), "addvideo_%s" % (courseid,), "mp4"])
        logging.info("------ done: addvideo_%s.webm" % (courseid,))
        return True
    else:
        logging.info("------ no additional video or webm file already exist , skip the encoding of addvideo to webm")
        return False

def encodeOldVideoMp4(folder,courseid):
    """ encode old video flv to mp4 if flv and no mp4 """
    videomp4 = "%s/%s.mp4" % (folder, courseid)
    videoipodmp4 = "%s/%s_ipod.mp4" % (folder, courseid)
    videoflv = "%s/%s.flv" % (folder, courseid)
    if exists(videoflv) and not exists(videomp4) and not exists(videoipodmp4):
        logging.info("------ start encode video flv to mp4 ...")
        # bash $PTHSCR/convertAll2Mp4.sh $MediaFolder $CourseID.$Extension $CourseID $PTHSCR/calculate_padding.sh true
        subprocess.call(["bash", "%s/convertAll2Mp4.sh" % (pthscr,), folder, "%s.flv" % (courseid,), 
            courseid, "%s/calculate_padding.sh" % (pthscr,), "true" ])
        logging.info("------ done: %s_ipod.mp4" % (courseid,))
        return True
    else:
        logging.info("------ no old flv video without mp4 or mp4 file already exist, skip the encoding of flv to mp4")
        return False

def addLinkMp4(folder,courseid):
    """ add link to id.mp4 if id_ipod.mp4 exist """
    videoipodmp4 = "%s/%s_ipod.mp4" % (folder, courseid)
    videomp4 = "%s/%s.mp4" % (folder, courseid)
    if exists(videoipodmp4) and not exists(videomp4):
        logging.info("------ create link id.mp4 -> id_ipod.mp4")
        subprocess.call(['ln', '-s', videoipodmp4, videomp4])
        logging.info("------ done: link %s.mp4 -> %s_ipod.mp4" % (courseid,courseid,))
        return True
    else:
        logging.info("------ no mp4 ipod or mp4 file already exist, skip the creation of the link %s.mp4 -> %s_ipod.mp4" % (courseid,courseid))
        return False

def changeMediaType(courseid):
    """ access base and get the current mediatype """
    try:
        conn = psycopg2.connect("host=%s port=%s dbname=%s user=%s password=%s" % (host,port,dbname,user,password))
        cur = conn.cursor()
        # get old mediatype
        cur.execute("SELECT mediatype FROM course WHERE courseid=%s" % (courseid,))
        old_mediatype = cur.fetchone()[0]
        logging.info("------ old mediatype: %s" % (old_mediatype))
        # change mediatype
        cur.execute("UPDATE course SET mediatype=(mediatype+2048) WHERE courseid=%s" % (courseid,))
        conn.commit()
        # new mediatype
        new_mediatype = int(old_mediatype)+2048
        logging.info("------ new mediatype: %s" % (str(new_mediatype),))
    except Exception, e:
        logging.error("------ unable to get or change the mediatype of course %s" % (courseid,))
    finally:
        cur.close()
        conn.close()

def changeFolderOwner(folder):
    """ change the owner of the folder """
    logging.info("------ change folder owner to %s %s" %(owner_user,owner_group))
    subprocess.call(["chown","-R", "%s:%s" % (owner_user,owner_group), folder])

if __name__ == '__main__':
    """
    launch the script
    """
 
    for i in range(interval['start'], interval['end']+1):
        courseid = str(i)
        mediafolder = getMediaFolder(courseid)
        folder = "%s/%s" % (home,mediafolder)

        if exists(folder):
            logging.info("check course %s in %s at %s" % (courseid, folder, str(datetime.now())))
            #videoslide webm
            videoslide = encodeVideoslide(folder,courseid)
            #video webm
            video = encodeVideo(folder,courseid)
            #addvideo webm
            addvideo = encodeAddVideo(folder,courseid)
            #encode old flv to ipod mp4
            oldvideo = encodeOldVideoMp4(folder,courseid)
            #link id_ipod.mp4 to id.mp4
            link = addLinkMp4(folder,courseid)
            #change mediatype
            if (videoslide or video or addvideo):
                logging.info("------ add webm to mediatype ...")
                changeMediaType(courseid)
            else:
                logging.info("------ no change mediatype")
            #change folder owner
            if (videoslide or video or addvideo or oldvideo or link):
                changeFolderOwner(folder)
            else:
                logging.info("------ no change owner folder")
        else:
            logging.warning("course %s in %s doesn't exist" % (courseid,folder,))


