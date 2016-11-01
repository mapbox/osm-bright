#!/usr/bin/env python

from TileStache import WSGITileServer


config = {
    'cache': {
        'name': 'Disk',
        'path': 'tile_cache',
        'umask': '0000'
    },
    'layers': {
        'osm_3857': {
            'provider': {'name': 'mapnik', 'mapfile': 'osm_3857.xml'},
            'projection': 'spherical mercator',
            'metatile': {'rows': 2, 'columns': 2, 'buffer': 128}
        }
    }
}


app = WSGITileServer(config=config, autoreload=True)
