FROM python:2
MAINTAINER Aldo Culquicondor "aldo@amigocloud.com"

RUN curl -sL https://deb.nodesource.com/setup_6.x -o setup_node.sh \
    && bash setup_node.sh && apt-get update \
    && apt-get install -y python-mapnik mapnik-utils osm2pgsql nodejs \
    fonts-sipa-arundina fonts-droid fonts-sil-padauk fonts-taml-tscu \
    fonts-khmeros fonts-gargi fonts-tibetan-machine ttf-unifont \
    && rm -rf /var/lib/apt/lists/*

COPY docker/tile_server/requirements.txt .
RUN npm install -g carto && pip install -r requirements.txt
COPY lib /root/lib
COPY docker/tile_server/configure.py make.py /root/

COPY shp /srv/tile_server/shp/
RUN shapeindex /srv/tile_server/shp/simplified-land-polygons-complete-3857/simplified_land_polygons.shp \
    && shapeindex /srv/tile_server/shp/land-polygons-split-3857/land_polygons.shp \
    && shapeindex /srv/tile_server/shp/10m-populated-places/10m-populated-places-simple.shp
COPY docker/tile_server/osm.py /srv/tile_server/
COPY osm-bright /root/osm-bright

RUN cd root && python make.py build \
    && carto build/project.mml > /srv/tile_server/osm_3857.xml \
    && ln -s /root/build/img /srv/tile_server/img \
    && ln -s /root/build/fonts /srv/tile_server/fonts

WORKDIR /srv/tile_server

CMD gunicorn -b 0.0.0.0:8000 -w 2 osm:app
