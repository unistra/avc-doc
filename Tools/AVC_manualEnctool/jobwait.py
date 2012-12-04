# This script is only used when separate medias encodage is true

import os, sys
import psycopg2 as dbapi2

courseid = sys.argv[1]
dbparam = sys.argv[2]

db = dbapi2.connect(dbparam)
cur = db.cursor()

if (courseid != ""):
        cur.execute("UPDATE job SET status='waiting' WHERE courseid = %s AND coursetype != 'ADDV';",(courseid,))

db.commit()
cur.close()
db.close()

