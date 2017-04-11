OSM Bright SQLite
=================

OSM Bright SQLite is a fork of OSM Bright Mapnik style which is
tailored to be used by SQLite database backend. 

![screenshot](https://raw.github.com/rinigus/osm-bright-sqlite/master/preview.png)

OSM Bright SQLite is written in the [Carto][] styling language and can
be opened as a project in [TileMill][].

OSM Bright SQLite includes import script that allows you to prepare
SQLite database from OpenStreetMap PBF dataset. For that, you would
have to have ogr2ogr and spatialite available.

The style is a work in progress and you are encouraged to use the
[issue tracker][] to note missing features or problems with the
current implementation.

[Carto]: http://github.com/mapbox/carto/
[TileMill]: https://www.mapbox.com/tilemill/
[issue tracker]: http://github.com/rinigus/osm-bright-sqlite/issues/

### Quickstart

Setup Instructions
------------------

### 1. Download shapefiles

OSM Bright SQLite depends on two large shapefiles. You will need to download and extract them before continuing. 

Download them to the `shp` directory in the osm-bright folder. You can do this with `wget` like:

    wget http://data.openstreetmapdata.com/simplified-land-polygons-complete-3857.zip
    wget http://data.openstreetmapdata.com/land-polygons-split-3857.zip

Once downloaded, extract them from their zip files. 

### 2. Run the shapefiles through shapeindex

Shapeindex is a tool that improves performance for shapefiles in Mapnik.

Mac and Linux users already have Shapeindex installed through Tilemill
or Mapnik but Windows users will need to download
[Shapeindex for Windows][] before continuing.

To run Shapeindex on Mac and Linux, go to the terminal, move to the
shp directory of osm-bright, run shapeindex in each shp subdirectory
like:

    shapeindex land-polygons-split-3857.shp

[Shapeindex for Windows]: http://mapnik.s3.amazonaws.com/dist/archive/shapeindex-2.2.0-win-x86_32.zip

### 3. Set up SQLite ###

You would need Spatialite and OGR2OGR tools installed.

### 4. Import OpenStreetMap data ###

You will need an OSM database extract in one of the following formats:

- .osm.pbf (binary; smallest & fastest)
- .osm.bz2 (compressed xml)
- .osm (xml)

You can find appropriate data extracts for a variety of regions at
<http://download.geofabrik.de> or <https://mapzen.com/metro-extracts/>. See
[the OSM wiki][2] for information about (very large) full-planet downloads.

You need to process this data and import it to your SQLite database. You can
do this with the included `import_sqlite.sh` script in import directory.

- Download PBF to import directory
- Run `import_sqlite.sh PBF_NAME`

### 5. Edit the configuration ###

You'll need to adjust some settings for things like your SQLite database
information.

1. Make a copy of `configure.py.sample` and name it `configure.py`.

    cp configure.py.sample configure.py

2. Open `configure.py` in a text editor.
3. Optionally change the name of your project from the default, 'OSM Bright'.
4. Adjust, if needed, the path to point to your MapBox project folder.
5. Make any adjustments to the SQLite database settings.
6. Optionally adjust the query extents or shapefile locations. (Refer to the 
   comments in the configuration file for more information.)
7. Save & close the file.

### 6. Run make.py ###

    ./make.py
    
This will create a new folder called "build" with your new project, customized
with the variables you set in `configure.py` and install a copy of this build
to your MapBox project folder. If you open up TileMill you should see your new
map in the project listing.

If you wish to generate Mapnik XML without editing in TileMill, run
    
    carto project.mml > mapnik.xml
    
in your MapBox project folder.

Click on the map to view it in the editing interface.

### Acknowledgments

Importer script is based on a blog post
http://www.ram-solutions.nl/2015/converting-openstreetmap-data-to-sqlite-and-render-it-using-the-osmbright-style
and the SQL script provided by the author of the post.

The approach described in that post was taken as a basis and tuned
further to provide complete solution.
