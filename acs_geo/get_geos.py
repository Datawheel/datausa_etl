# import pandas as pd
# import requests
# from helpers.get_dataframe import get_dataframe
#
# summary_levels = {"states":"040",
#     "counties":"050",
#     "tracts":"140",
#     "places":"160",
#     "msas":"310"}
#
# if __name__ == '__main__':
#
#     acs_release='acs2010_5yr'
#     for slevel, scode in summary_levels.items():
#         print slevel
#         df = get_dataframe(tables='B01001', geoids='{}|01000US25'.format(scode),col_names=True, geo_names=True, release=acs_release)
#         print df["name"].head(10)


import ftplib
ftp = ftplib.FTP('ftp2.census.gov')
ftp.login()
ftp.cwd("/geo/tiger/TIGER2012/STATE")


from ftplib import FTP
from io import BytesIO

ftp = FTP('ftp.kernel.org') 
ftp.login()
r = StringIO()
ftp.retrbinary('RETR /pub/README_ABOUT_BZ2_FILES', r.write)

print r.getvalue()


import urllib
import io
import os
import subprocess
from zipfile import ZipFile
mysock = urllib.urlopen('ftp://ftp2.census.gov/geo/tiger/TIGER2012/STATE/tl_2012_us_state.zip')
memfile = io.BytesIO(mysock.read())

x = None

with ZipFile(memfile, 'r') as myzip:
    for filename in myzip.namelist():
        print filename
        if filename[-4:] == ".shp":
            x = io.BytesIO(myzip.read(filename))
            x.seek(0)
            p1 = subprocess.Popen(["shp2pgsql", "-W", "latin1","-s 4326","-p","-I"], stdin=x, stdout=subprocess.PIPE)
            out, err = p1.communicate()
            print out
            
            
            # data = myzip.read(filename)
            
            # cmd = '''shp2pgsql -W "latin1" -s 4326 -p -I $one_shapefile tiger2012.STATE'''.format(f, tablename, fields, fields_null)
            
            stdout, stderr= p2.communicate()
            
            
            # print cmd
            os.system(cmd)