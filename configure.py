#!/usr/bin/env python

## OSM BRIGHT CARTO TEMPLATE CONFIGURATION OPTIONS #############################

config = {
  "importer": "imposm", # either 'imposm' or 'osm2pgsql'
  "postgis": {}
}

# PostGIS connection setup
# Leave empty for Mapnik defaults. The only required parameter is dbname.
config["postgis"]["host"]     = ""
config["postgis"]["port"]     = ""
config["postgis"]["dbname"]   = "osm"
config["postgis"]["user"]     = ""
config["postgis"]["password"] = ""

# Increase performance if you are only rendering a particular area by
# specifying a bounding box to restrict queries. Format is "XMIN,YMIN,XMAX,YMAX"
# in the same units as the database (probably spherical mercator meters). The
# whole world is "-20037508.34 -20037508.34 20037508.34 20037508.34".
# Leave blank to let Mapnik estimate.
config["postgis"]["extent"] = "-20037508.34 -20037508.34 20037508.34 20037508.34"

# Land shapefiles required for the style. If you have already downloaded
# these or wish to use different versions, specify their paths here.
# OSM land shapefiles from MapBox are indexed for Mapnik and have blatant 
# errors corrected (eg triangles along the 180 E/W line), but are updated
# infrequently. The latest versions can be downloaded from osm.org:
# - http://tile.openstreetmap.org/processed_p.tar.bz2
# - http://tile.openstreetmap.org/shoreline_300.tar.bz2
processed_p = "http://tilemill-data.s3.amazonaws.com/osm/coastline-good.zip"
shoreline_300 = "http://tilemill-data.s3.amazonaws.com/osm/shoreline_300.zip"

################################################################################

import json
from sys import path
from os.path import join

template = join(path[0], 'osm-bright.' + config["importer"] + '.mml')
output = join(path[0], 'osm-bright', 'project.mml')

with open(template, 'r') as f:
  newf = json.loads(f.read())
f.closed

with open(output, 'w') as f:
  for layer in newf["Layer"]:
    if layer["id"] == "shoreline_300":
      layer["Datasource"]["file"] = shoreline_300
    elif (layer["id"] == "processed_p") or (layer["id"] == "processed_p_outline"):
      layer["Datasource"]["file"] = processed_p
    else:
      # Assume all other layers are PostGIS layers
      for opt, val in config["postgis"].iteritems():
        if (val == ""):
          if (opt in layer["Datasource"]):
            del layer["Datasource"][opt]
        else:
          layer["Datasource"][opt] = val
  f.write(json.dumps(newf, sort_keys=True, indent=2))
f.closed

