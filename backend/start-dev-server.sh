#!/bin/bash
# Make sure data is only loaded on first start
#if [ ! -d /data ]; then
#  echo "Downloading data..."
#  mkdir /data
#  wget \
#    -O /data/SoHAffordabilityDatabyNeighborhoodUpload.csv \
#    https://raw.githubusercontent.com/hackoregon/housing-backend/datasources/SoHAffordabilityDatabyNeighborhoodUpload.csv
#  wget \
#    -O /data/jchs-data-2017.xlsx \
#    http://www.jchs.harvard.edu/sites/jchs.harvard.edu/files/all_son_2017_tables_current_6_12_17.xlsx
#  echo "Migrating database..."
#  while ! ./manage.py migrate >> /dev/null 2>&1 ; do
#    sleep 1
#  done
#  echo "Loading data..."
#  ./manage.py shell --command="import housing_backend.loader"
#fi
echo "Loading data from loader.py"
./manage.py shell --command="import housing_backend.loader"
#./manage.py collectstatic --noinput
gunicorn backend.wsgi:application -b :8000
