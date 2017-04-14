#!/bin/bash

# Add PBF file into this directory and run ./import.sh <PBFfilename>

set -e

if [ "$#" -ne 1 ]; then
    echo "Usage: ./import.sh openstreetmapfilename"
    exit 0
fi

PROGPATH=$(dirname "$0")

D=${1%-latest.osm.pbf}
D=${D%.osm.pbf}
D=${D%.pbf} 
D=${D%.osm}
D=$D.sqlite

if [ "$1" == "$D" ] 
then
  D=$1-imported
fi

echo "Importing to" "$D"

rm "$D" || true

echo "Preliminary import using ogr2ogr"
ogr2ogr -f SQLite "$D" $1 -progress -dsco SPATIALITE=YES -gt 65536 --config OSM_CONFIG_FILE $PROGPATH/osmconf.ini -lco SPATIAL_INDEX=NO #-lco COMPRESS_GEOM=YES
spatialite -bail "$D" < $PROGPATH/reorganize.sql

for table in `sqlite3 "$D" "SELECT name FROM sqlite_master WHERE type='table' AND name GLOB 'osm_*'"`; do
    echo "Finding extent:" $table
    sqlite3 "$D" "INSERT INTO mapnik_metadata (f_table_name, xmin, ymin, xmax, ymax) SELECT '${table}' AS f_table_name, MIN(xmin), MIN(ymin), MAX(xmax), MAX(ymax) FROM idx_${table}_geometry"
done
