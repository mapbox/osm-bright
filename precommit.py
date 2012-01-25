#!/usr/bin/env python

## Run this script before preparing a Git commit in order to pull your changes
## from your working .mml to one in the root directory with default settings.

################################################################################

config = { "postgis": {} }

config["postgis"]["host"]     = ""
config["postgis"]["port"]     = ""
config["postgis"]["dbname"]   = "osm"
config["postgis"]["user"]     = ""
config["postgis"]["password"] = ""

config["postgis"]["extent"] = "-20037508.34 -20037508.34 20037508.34 20037508.34"

processed_p = "http://tilemill-data.s3.amazonaws.com/osm/coastline-good.zip"
shoreline_300 = "http://tilemill-data.s3.amazonaws.com/osm/shoreline_300.zip"

import json
from sys import path
from os.path import join

output = join(path[0], 'osm-bright.imposm.mml')
template = join(path[0], 'osm-bright', 'project.mml')

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

