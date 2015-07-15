# DataUSA ETL Library
ETL scripts for various US datasets. Fetching from their raw source, manipulating them and finally ingesting them into a postgreSQL database.

Required libraries:
postgres
postgis

step 0: Set Environment Variables
```
export datausa_etl_user=alexandersimoes
export datausa_etl_db=datausa
export datausa_etl_api=http://localhost:5000
```

step 1: Create Postgres Database
```
createdb -O $datausa_etl_user -E utf8 $datausa_etl_db
```

step 2: Run script to populate geography with year as argument
```
bash acs_geo/geos_to_psql.sh 2013
```

step 3: Calculate geo names/containment via SQL scripts
```
psql -U $datausa_etl_user -d $datausa_etl_db -h localhost -q -f acs_geo/insert_geo_names.sql
psql -U $datausa_etl_user -d $datausa_etl_db -h localhost -q -f acs_geo/insert_geo_containment.sql
```

step 4: Create data tables
```
psql -U $datausa_etl_user -d $datausa_etl_db -h localhost -q -f acs_data/create_tbls.sql
```

step 5: Import ACS data (specific dataset)
```
python acs_data/acs.py --indicator=B05006 --sumlevel=310 --year=2013 --year_est=5
```

OR

step 5: Import all data
```
bash acs_data/acs_all.sh
```