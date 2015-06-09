set -e # exit script if any commands fail

if [ $# -eq 0 ]; then
  echo "No arguments provided, need a year"
  exit 1
fi

year=$1
pwd=/${PWD#*/}
mkdir -p $pwd/data/tiger$year

geos=(STATE COUNTY CBSA PLACE ZCTA5 PUMA TRACT)
sum_levels=(040 050 310 160 860 795 140)

psql -d census_new -h localhost -q -c "CREATE EXTENSION IF NOT EXISTS postgis;"
psql -d census_new -h localhost -q -c "CREATE SCHEMA IF NOT EXISTS tiger$year;"
psql -d census_new -h localhost -q -c "ALTER SCHEMA tiger$year OWNER TO census;"

for ((i = 0; i < ${#geos[@]}; i++))
do
    current_geo=${geos[$i]}
    current_sum_level=${sum_levels[$i]}
    
    wget --recursive --continue --accept=*.zip \
         --no-parent --cut-dirs=3 --no-host-directories \
         --directory-prefix=$pwd/data/tiger$year \
        ftp://ftp2.census.gov/geo/tiger/TIGER$year/$current_geo/
   
    cd $pwd/data/tiger$year/$current_geo/
    for ii in *.zip
    do
        unzip -q -n $ii -d `dirname $ii`
    done

    # Pick one of the shapefiles to build schema with
    one_shapefile=`ls -a *.shp | head -n 1`

    # Start by preparing the table
    shp2pgsql -W "latin1" -s 4326 -p -I $one_shapefile tiger$year.$current_geo > $current_geo.sql

    # Then append all the geometries
    for j in *.shp
    do
        shp2pgsql -W "latin1" -s 4326 -a $j tiger$year.$current_geo >> $current_geo.sql
    done

    # Then load them in to postgres
    psql -d census_new -h localhost -q -c "DROP TABLE IF EXISTS tiger$year.$current_geo;"
    psql -d census_new -h localhost -q -f $current_geo.sql

done