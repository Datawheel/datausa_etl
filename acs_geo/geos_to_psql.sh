set -e # exit script if any commands fail

if [ $# -eq 0 ]; then
  echo "No arguments provided, need a year"
  exit 1
fi

# create directory to store all data
year=$1
pwd=/${PWD#*/}
mkdir -p $pwd/data/tiger$year

# the sumlevels we're intereted in
# CBSA = MSA
# ZCTA5 = Zip Codes
geos=(STATE COUNTY CBSA PLACE ZCTA5 PUMA TRACT)
sum_levels=(040 050 310 160 860 795 140)

# need postgis extension for storing geographic data about locations
psql -d census_new -h localhost -q -c "CREATE EXTENSION IF NOT EXISTS postgis;"

# create a schema for this year
psql -d census_new -h localhost -q -c "CREATE SCHEMA IF NOT EXISTS tiger$year;"
psql -d census_new -h localhost -q -c "ALTER SCHEMA tiger$year OWNER TO census;"

# looping through geo sumlevels
for ((i = 0; i < ${#geos[@]}; i++))
do
    current_geo=${geos[$i]}
    current_sum_level=${sum_levels[$i]}
    
    # download data from census FTP via wget command
    wget --recursive --continue --accept=*.zip \
         --no-parent --cut-dirs=3 --no-host-directories \
         --directory-prefix=$pwd/data/tiger$year \
        ftp://ftp2.census.gov/geo/tiger/TIGER$year/$current_geo/
    
    # change into new directory and unzip zipped files
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

    # Then load them into postgres
    psql -d census_new -h localhost -q -c "DROP TABLE IF EXISTS tiger$year.$current_geo;"
    psql -d census_new -h localhost -q -f $current_geo.sql
done