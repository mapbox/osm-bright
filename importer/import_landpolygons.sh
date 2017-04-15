#!/bin/bash

set -e

# adjust the directory where are land polygons from
#
# - http://data.openstreetmapdata.com/simplified-land-polygons-complete-3857.zip
# - http://data.openstreetmapdata.com/land-polygons-split-3857.zip
# 

MapsDir=maps/global

rm $MapsDir/land-polygons-split.sqlite $MapsDir/simplified-land-polygons.sqlite || true

echo Importing Shapefiles
ogr2ogr -progress -f SQLite $MapsDir/land-polygons-split.sqlite $MapsDir/land-polygons-split-3857/land_polygons.shp -dsco SPATIALITE=YES -gt 65536
ogr2ogr -progress -f SQLite $MapsDir/simplified-land-polygons.sqlite $MapsDir/simplified-land-polygons-complete-3857/simplified_land_polygons.shp -dsco SPATIALITE=YES -gt 65536
