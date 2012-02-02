#!/usr/bin/env python

import json
from os import unlink, mkdir, listdir, chdir, getcwd
from sys import path
from glob import glob
from shutil import copytree, rmtree
from os.path import join, isdir, split

from configure import config, processed_p, shoreline_300

def clean():
  if isdir("build"):
    rmtree("build")

  for f in glob("build/*.html"): unlink(f)

def build():
  #copy the osm-bright tree to a build dir
  copytree("osm-bright", "build")

  #remove the mml templates
  for f in glob("build/*.mml"):
    unlink(f)

  #load the project template
  templatefile = open(join('osm-bright', 'osm-bright.%s.mml' % config["importer"]))
  template = json.loads(templatefile.read())

  #fill in the project template
  for layer in template["Layer"]:
    if layer["id"] == "shoreline_300":
      layer["Datasource"]["file"] = shoreline_300
    elif layer["id"] in ("processed_p", "processed_p_outline"):
      layer["Datasource"]["file"] = processed_p
    else:
      # Assume all other layers are PostGIS layers
      for opt, val in config["postgis"].iteritems():
        if (val == ""):
          if (opt in layer["Datasource"]):
            del layer["Datasource"][opt]
        else:
          layer["Datasource"][opt] = val

  #dump the filled-in project template to the build dir
  with open(join('build', 'project.mml'), 'w') as output:
    output.write(json.dumps(template, sort_keys=True, indent=2))

if __name__ == "__main__":
  clean()
  build()
