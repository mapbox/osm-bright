OSM Bright
==========

![screenshot](https://raw.github.com/mapbox/osm-bright/master/preview.png)

OSM Bright is a sensible starting point for quickly making beautiful maps based
on an OpenStreetMap database. It is written in the [Carto][] styling language
and can be opened as a project in [TileMill][].

The style is still a work in progress and you are encouraged to use the
[issue tracker][] to note missing features or problems with the current
implementation. 

[Carto]: http://github.com/mapbox/carto/
[TileMill]: http://tilemill.com/
[issue tracker]: http://github.com/developmentseed/osm-bright/issues/

Setup Instructions
------------------

### 1. Set up PostgreSQL & PostGIS ###

If you don't already, you need to have [PostgreSQL][] installed & running with
a [PostGIS][] database setup within it. See the [PostGIS documentation][1] for
full information on how to do this

[PostgreSQL]: http://postgresql.org/
[PostGIS]: http://postgis.refractions.net/
[1]: http://postgis.refractions.net/documentation/manual-1.5/

### 2. Import OpenStreetMap data ###

You will need an OSM database extract in one of the following formats:

- .osm.pbf (binary; smallest & fastest)
- .osm.bz2 (compressed xml)
- .osm (xml)

You can find appropriate data extracts for a variety of regions at
<http://download.geofabrik.de/osm> or <http://downloads.cloudmade.com>. Exracts
of select metropolitan areas are available at <http://metro.teczno.com>. See
[the OSM wiki][2] for information about (very large) full-planet downloads.

OSM Bright requires a PostGIS database imported with [Imposm][] using the 
[included mapping configuration](https://github.com/mapbox/osm-bright/blob/master/imposm-mapping.py)

The Imposm import command looks like this:

    imposm -U <postgres_user> -d <postgis_database> \
      -m /path/to/osm-bright/imposm-mapping.py --read --write \
      --optimize --deploy-production-tables <data.osm.pbf>

See `imposm --help` or the [online documentation][3] for more details.

Note that if you use a custom database prefix or want to see the style on a
tables that have not been "deployed to production" (ie. have an `osm_new_`
prefix) you will have to manually update the SQL queries in the MML file to
reflect this.

[2]: http://wiki.openstreetmap.org/wiki/Planet
[Imposm]: http://imposm.org/
[3]: http://imposm.org/

### 3. Run configure.py ###

Included in with this style is a configuration script to help you adjust
parameters such as the database connection information and a few other things.

TODO: go on...
