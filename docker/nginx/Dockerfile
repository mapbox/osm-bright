FROM nginx
MAINTAINER Aldo Culquicondor "aldo@amigocloud.com"

RUN rm /etc/nginx/conf.d/default.conf
COPY all.conf /etc/nginx/conf.d/all.conf

COPY index.html /srv/leaflet/index.html
