#!/bin/bash

# Add PBF file into this directory and run ./import.sh <PBFfilename>

set -e

# unset the variable CONVERT_TO_TWKB if you wish to keep geometry in
# WKB by commenting the following line out. To get TWKB, set it to "Y"
CONVERT_TO_TWKB="Y"
TWKB_PRECISION=6

if [[ "$#" -ne 1 && "$#" -ne 2 ]]; then
    echo "Usage: ./import.sh openstreetmap_filename [sqlite_filename]"
    exit 0
fi

PROGPATH=$(dirname "$0")

if [ "$#" -eq 1 ]; then
    D=${1%-latest.osm.pbf}
    D=${D%.osm.pbf}
    D=${D%.pbf} 
    D=${D%.osm}
    D=$D.sqlite

    if [ "$1" == "$D" ] 
    then
        D=$1-imported
    fi
fi

if [ "$#" -eq 2 ]; then
    D=$2
fi

echo "Importing" $1 "to" $D

rm "$D" || true

echo "Preliminary import using ogr2ogr"
ogr2ogr -f SQLite "$D" $1 -progress -dsco SPATIALITE=YES -gt 65536 --config OSM_CONFIG_FILE $PROGPATH/osmconf.ini -lco SPATIAL_INDEX=NO
spatialite -bail "$D" < $PROGPATH/reorganize.sql

for table in `sqlite3 "$D" "SELECT name FROM sqlite_master WHERE type='table' AND name GLOB 'osm_*'"`; do
    echo "Finding extent:" $table
    sqlite3 "$D" "INSERT INTO mapnik_metadata (f_table_name, xmin, ymin, xmax, ymax) SELECT '${table}' AS f_table_name, MIN(xmin), MIN(ymin), MAX(xmax), MAX(ymax) FROM idx_${table}_geometry"
done

for table in `sqlite3 "$D" "SELECT name FROM sqlite_master WHERE type='table' AND name GLOB 'osm_*'"`; do
    echo "Converting to WKB:" $table
    spatialite -silent -noheader "$D" "SELECT DiscardGeometryColumn('${table}', 'GEOMETRY'); UPDATE ${table} SET geometry = (SELECT AsBinary(geometry) FROM ${table} t2 where ${table}.rowid=t2.rowid);"

    if [ "x$CONVERT_TO_TWKB" == "xY" ]; then
        precision=$TWKB_PRECISION
        if [[ "$table" == "osm_admin_gen0" || "$table" == "osm_admin_gen1" || "$table" == "osm_landusages_gen0" || "$table" == "osm_landusages_gen1" || "$table" == "osm_landusage_overlays_gen0" || "$table" == "osm_landusage_overlays_gen1" || "$table" == "osm_motorways_gen0" || "$table" == "osm_roads_gen1" || "$table" == "osm_roads_gen2" || "$table" == "osm_waterareas_gen0" || "$table" == "osm_waterareas_gen1" || "$table" == "osm_waterways_low" ]]; then
            precision=4
        fi
        echo "Converting to TWKB:" $table        
        $PROGPATH/wkb2twkb-sqlite/wkb2twkb-sqlite "$D" ${table} 'GEOMETRY' $precision
    fi
done

echo "Database cleanup"
sqlite3 "$D" "DROP TABLE IF EXISTS SPATIAL_REF_SYS"
sqlite3 "$D" "DROP TABLE IF EXISTS SPATIAL_REF_SYS_AUX"

echo "VACUUM"
sqlite3 "$D" "PRAGMA temp_store=MEMORY; VACUUM;"
