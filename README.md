OSM Bright
==========

*A sensible starting point for quickly making beautiful maps based on an
"out-of-the-box" OpenStreetMap database.*

Setup Instructions
------------------

### 1. Set up PostgreSQL & PostGIS ###

If you don't already, you need to have [PostgreSQL][] installed & running with
a [PostGIS][] database setup withing it. See the [PostGIS documentation][1] for
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
<http://download.geofabrik.de/osm> or <http://downloads.cloudmade.com>. See
also [the OSM wiki][3] for information about (very large) full-planet
downloads.

OSM Bright requires a PostGIS database imported with [ImpOSM][]. Support for
OSM2PGSQL is planned but not yet implemented.

A basic ImpOSM import command looks like:

    imposm --read --write --deploy-production-tables -U <user> -d <db> <data.osm.pbf>

See `imposm --help` or the [online documentation][2] for more details.

Note that if you use a custom database prefix or want to see the style on a
tables that have not been "deployed to production" (ie. have an `osm_new_`
prefix) you will have to manually update the SQL queries in the MML file to
reflect this.

[3]: http://wiki.openstreetmap.org/wiki/Planet
[ImpOSM]: http://imposm.org/
[1]: http://imposm.org/

### 3. Run configure.py ###

Included in with this style is a configuration script to help you adjust
parameters such as the database connection information and a few other things.

TODO: go on...
