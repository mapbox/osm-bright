FROM python:2
MAINTAINER Aldo Culquicondor "aldo@amigocloud.com"

RUN apt-get update && apt-get install -y python-mapnik osm2pgsql mapnik-utils \
    fonts-sipa-arundina fonts-droid fonts-sil-padauk fonts-taml-tscu \
    fonts-khmeros fonts-gargi fonts-tibetan-machine ttf-unifont \
    && rm -rf /var/lib/apt/lists/*

COPY docker/tile_server/requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /srv/tile_server
COPY osm-bright/img img/
COPY shp shp/
RUN shapeindex shp/simplified-land-polygons-complete-3857/simplified_land_polygons.shp \
    && shapeindex shp/land-polygons-split-3857/land_polygons.shp \
    && shapeindex shp/10m-populated-places/10m-populated-places-simple.shp
COPY docker/tile_server/osm.py docker/tile_server/osm.xml ./

CMD gunicorn -b 0.0.0.0:8000 -w 2 osm:app
