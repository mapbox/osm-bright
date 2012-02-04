#!/usr/bin/env python

import re
import sys

from os import unlink
from json import loads, dumps
from glob import glob
from shutil import rmtree
from os.path import join, isdir

#unlike shutils.copytree, will copy files without disturbing anything that was added
from distutils.dir_util import copy_tree

from configure import config
from lib.utils import copy_tree

def clean():
  if isdir("build"):
    rmtree("build")

  for f in glob("build/*.html"): unlink(f)

def build():
  #copy the osm-bright tree to a build dir
  copy_tree("osm-bright", "build")

  #remove the mml templates
  for f in glob("build/*.mml"):
    unlink(f)

  #load the project template
  templatefile = open(join('osm-bright', 'osm-bright.%s.mml' % config["importer"]))
  template = loads(templatefile.read())

  #fill in the project template
  for layer in template["Layer"]:
    if layer["id"] == "shoreline_300":
      layer["Datasource"]["file"] = config["shoreline_300"]
    elif layer["id"] in ("processed_p", "processed_p_outline"):
      layer["Datasource"]["file"] = config["processed_p"]
    else:
      # Assume all other layers are PostGIS layers
      for opt, val in config["postgis"].iteritems():
        if (val == ""):
          if (opt in layer["Datasource"]):
            del layer["Datasource"][opt]
        else:
          layer["Datasource"][opt] = val

  template["name"] = config["name"]

  #dump the filled-in project template to the build dir
  with open(join('build', 'project.mml'), 'w') as output:
    output.write(dumps(template, sort_keys=True, indent=2))

def install():
  assert isdir(config["path"]), "Config.path does not point to your mapbox projects directory; please fix and re-run"
  sanitized_name = re.sub("[^\w]", "", config["name"])
  output_dir = join(config["path"], sanitized_name)
  print "installing to %s" % output_dir
  copy_tree("build", output_dir)

def pull():
  #copy the project from mapbox to osm-bright
  sanitized_name = re.sub("[^\w]", "", config["name"])
  output_dir = join(config["path"], sanitized_name)
  copy_tree(output_dir, "osm-bright")

  #load the project file
  project = loads(open(join("osm-bright", "project.mml")))

  #Make sure we reset postgis data in the project file back to its default values
  defaultconfig = defaultdict(defaultdict)
  defaultconfig["postgis"]["host"]     = ""
  defaultconfig["postgis"]["port"]     = ""
  defaultconfig["postgis"]["dbname"]   = "osm"
  defaultconfig["postgis"]["user"]     = ""
  defaultconfig["postgis"]["password"] = ""
  defaultconfig["postgis"]["extent"] = "-20037508.34 -20037508.34 20037508.34 20037508.34"
  defaultconfig["name"] = "NYC Bright Osm2pgsql"
  defaultconfig["processed_p"] = "http://tilemill-data.s3.amazonaws.com/osm/coastline-good.zip"
  defaultconfig["shoreline_300"] = "http://tilemill-data.s3.amazonaws.com/osm/shoreline_300.zip"

  for layer in project["Layer"]:
    if layer["id"] == "shoreline_300":
      layer["Datasource"]["file"] = defaultconfig["shoreline_300"]
    elif layer["id"] in ("processed_p", "processed_p_outline"):
      layer["Datasource"]["file"] = defaultconfig["processed_p"]
    else:
      # Assume all other layers are PostGIS layers
      for opt, val in defaultconfig["postgis"].iteritems():
        if not val and opt in layer["Datasource"]:
          del layer["Datasource"][opt]
        else:
          layer["Datasource"][opt] = val

  project_template = open(join("build", "osm-bright.%s.mml") % config["importer"], 'w')
  project_template.write(dumps(project, sort_keys=True, indent=2))

if __name__ == "__main__":
  if sys.argv[-1] == "clean":
    clean()
  elif sys.argv[-1] == "build":
    build()
  elif sys.argv[-1] == "install":
    install()
  elif sys.argv[-1] == "pull":
    pull()
  else:
    clean()
    build()
    install()
