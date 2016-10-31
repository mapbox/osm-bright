#!/usr/bin/env python
from cStringIO import StringIO

from flask import Flask, send_file
from ModestMaps.Core import Coordinate
from TileStache import parseConfig, getTile


app = Flask(__name__)

config = parseConfig({
    'cache': {
        'name': 'Disk',
        'path': 'tile_cache',
        'umask': '0000'
    },
    'layers': {
        'osm': {
            'provider': {'name': 'mapnik', 'mapfile': 'osm.xml'},
            'projection': 'spherical mercator',
            'metatile': {'rows': 2, 'columns': 2, 'buffer': 64}
        }
    }
})


@app.route('/<int:z>/<int:x>/<int:y>.png')
def base_layer(z, x, y):
    content_type, tile = getTile(config.layers['osm'], Coordinate(y, x, z),
                                 'png')
    return send_file(StringIO(tile), mimetype=content_type)


if __name__ == '__main__':
    app.run()
