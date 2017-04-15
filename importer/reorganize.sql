PRAGMA journal_mode = OFF;
PRAGMA temp_store =  MEMORY;

-- -- SIMPLIFY GEOMETRY AND PREPARE TABLES
-- SELECT date(), time(), 'Simplify geometry and prepare tables';

-- UPDATE lines SET geometry = (SELECT ST_SimplifyPreserveTopology(geometry, 0.000005) from lines l2 where lines.rowid=l2.rowid);
-- UPDATE multipolygons SET geometry = (SELECT CastToMultiPolygon(ST_SimplifyPreserveTopology(geometry, 0.000005)) from multipolygons m2 where multipolygons.rowid=m2.rowid);

-- READY FOR IMPORT

DROP VIEW IF EXISTS vw_osm_admin;
CREATE VIEW vw_osm_admin AS SELECT geometry, admin_level FROM multipolygons
WHERE boundary IN ('administrative') AND admin_level IN ('2');

DROP VIEW IF EXISTS vw_osm_aeroways;
CREATE VIEW vw_osm_aeroways AS SELECT geometry, (aeroway='runway') AS is_runway FROM lines
WHERE aeroway IN ('runway', 'taxiway');

DROP VIEW IF EXISTS vw_osm_airports;
CREATE VIEW vw_osm_airports AS SELECT geometry, name, iata
FROM (
SELECT geometry, name, iata FROM points WHERE aeroway='aerodrome'
UNION ALL
SELECT ST_PointOnSurface(geometry) AS geometry, name, iata FROM multipolygons
WHERE aeroway='aerodrome' AND ST_IsValid(geometry)
);

-- osm_id is kept to allow filtering later
DROP VIEW IF EXISTS vw_osm_amenity;
CREATE VIEW vw_osm_amenity AS SELECT osm_id, geometry, name,
CASE
WHEN tourism IS NOT NULL THEN 'tourism_' || tourism
WHEN highway IS NOT NULL THEN 'highway_' || highway
WHEN man_made IS NOT NULL THEN 'man_made_' || man_made
WHEN shop IS NOT NULL THEN 'shop_' || shop
WHEN leisure IS NOT NULL THEN 'leisure_' || leisure
WHEN natural IS NOT NULL THEN 'natural_' || natural
WHEN amenity IS NOT NULL THEN 'amenity_' || amenity
ELSE NULL END AS feature
FROM (
SELECT osm_id, geometry, name, tourism, aeroway, highway, man_made, shop, leisure, natural, amenity FROM points WHERE name IS NOT NULL
UNION ALL
SELECT osm_id, ST_PointOnSurface(geometry) AS geometry, name, tourism, aeroway, highway, man_made, shop, leisure, natural, amenity FROM multipolygons
WHERE name IS NOT NULL AND ST_IsValid(geometry)
)
WHERE
amenity IN ('hospital', 'townhall', 'shelter', 'bus_station', 'atm', 'bank', 'bar', 'bicycle_rental', 'taxi',
'cafe', 'car_rental', 'cinema', 'fire_station', 'fountain', 'charging_station', 'fuel', 'embassy',
'parking', 'library', 'courthouse', 'clinic', 'doctors', 'place_of_worship', 'police', 'post_office', 'pub', 'biergarten',
'restaurant', 'food_court', 'fast_food', 'theatre', 'arts_centre', 'toilets' ) OR
highway IN ('bus_stop', 'ford' ) OR
leisure IN ('water_park', 'dog_park', 'playground' ) OR
man_made IN ('lighthouse') OR
shop IN ('department_store', 'supermarket', 'art', 'bag', 'bakery', 'beverages', 'books', 'butcher', 'coffee', 'convenience', 'deli', 'doityourself', 'hardware',
'fishmonger', 'seafood', 'garden_centre', 'toys', 'sports' ) OR
tourism IN ('alpine_hut', 'wilderness_hut', 'museum', 'camp_site', 'caravan_site', 'picnic_site', 'artwork', 'hostel', 'hotel', 'motel', 'information', 'zoo' );

SELECT date(), time(), 'Create temporary table with all amenity IDs';
CREATE TABLE tmp_osm_amenity_ids AS SELECT osm_id AS osm_id FROM vw_osm_amenity;
CREATE INDEX index_tmp_osm_amenity_ids ON tmp_osm_amenity_ids(osm_id);

DROP VIEW IF EXISTS vw_osm_amenity_gen0;
CREATE VIEW vw_osm_amenity_gen0 AS SELECT geometry, name, feature FROM vw_osm_amenity
WHERE feature IN ('amenity_hospital', 'natural_peak', 'natural_volcano');

DROP VIEW IF EXISTS vw_osm_amenity_gen1;
CREATE VIEW vw_osm_amenity_gen1 AS SELECT geometry, name, feature FROM vw_osm_amenity
WHERE feature IN ('amenity_townhall', 'amenity_shelter', 'tourism_alpine_hut', 'tourism_wilderness_hut', 'tourism_museum');

DROP VIEW IF EXISTS vw_osm_amenity_fuel;
CREATE VIEW vw_osm_amenity_fuel AS SELECT geometry, name, feature FROM vw_osm_amenity
WHERE feature IN ('amenity_charging_station', 'amenity_fuel');

DROP VIEW IF EXISTS vw_osm_amenity_gen2;
CREATE VIEW vw_osm_amenity_gen2 AS SELECT geometry, name, feature FROM vw_osm_amenity
WHERE feature IN ('highway_bus_stop', 'amenity_bus_station', 'amenity_parking', 'amenity_bicycle_parking', 'amenity_motorcycle_parking',
'amenity_pharmacy', 'man_made_lighthouse', 'tourism_camp_site', 'tourism_caravan_site',
'tourism_picnic_site', 'shop_department_store');

DROP VIEW IF EXISTS vw_osm_amenity_points;
CREATE VIEW vw_osm_amenity_points AS SELECT geometry, name, feature FROM vw_osm_amenity
WHERE feature IN ('amenity_atm', 'amenity_bank', 'amenity_bar', 'amenity_bicycle_rental', 'amenity_taxi', 'amenity_cafe', 'tourism_artwork',
'amenity_car_rental', 'amenity_cinema', 'amenity_fire_station', 'amenity_fountain', 'tourism_hostel', 'tourism_hotel', 'tourism_motel', 'tourism_information',
'amenity_embassy', 'amenity_library', 'amenity_courthouse', 'amenity_clinic', 'amenity_doctors', 'amenity_place_of_worship', 'amenity_police',
'amenity_post_office', 'amenity_pub', 'amenity_biergarten', 'amenity_restaurant', 'amenity_food_court', 'amenity_fast_food', 'amenity_theatre',
'amenity_arts_centre', 'amenity_toilets', 'shop_supermarket', 'shop_art', 'shop_bag', 'shop_bakery', 'shop_beverages', 'shop_books', 'shop_butcher',
'shop_coffee', 'shop_convenience', 'shop_deli', 'shop_doityourself', 'shop_hardware', 'shop_fishmonger', 'shop_seafood', 'shop_garden_centre', 'shop_toys',
'shop_sports', 'leisure_water_park', 'leisure_dog_park', 'leisure_playground'
);



-- skip areas which are registered as amenity
DROP VIEW IF EXISTS vw_osm_area_labels;
CREATE VIEW vw_osm_area_labels AS SELECT ST_PointOnSurface(geometry) AS geometry, name,
CASE
WHEN leisure IN ('park', 'garden') THEN 'park'
WHEN leisure IN ('golf_course') THEN leisure
WHEN landuse='cemetery' OR amenity = 'grave_yard' THEN 'cemetery'
WHEN amenity='hospital' THEN 'hospital'
WHEN amenity IN ('college', 'kindergarten', 'school', 'university') THEN 'school'
WHEN landuse IN ('basin', 'reservoir') OR natural IN ('water') OR waterway IN ('riverbank') THEN 'water'
ELSE NULL END AS type, ST_Area(geometry) AS area
FROM multipolygons
WHERE ST_IsValid(geometry) AND building IS NULL AND name IS NOT NULL AND (aeroway IS NULL OR aeroway NOT IN ('aerodrome'))
AND NOT EXISTS(SELECT 1 FROM tmp_osm_amenity_ids WHERE tmp_osm_amenity_ids.osm_id=multipolygons.osm_id);

-- DROP VIEW IF EXISTS vw_osm_barrierpoints;
-- CREATE VIEW vw_osm_barrierpoints AS SELECT geometry, 
-- CASE
-- WHEN barrier IN ('toll_booth', 'stile', 'gate', 'horse_stile','lift_gate', 'kissing_gate','cattle_grid','entrance') THEN 'gate'
-- WHEN barrier IN ('block', 'bollard', 'chain', 'cycle_barrier', 'spikes', 'fence', 'wire_fence','yes') THEN 'divider'
-- ELSE NULL
-- END AS stylegroup
-- FROM points WHERE stylegroup IS NOT NULL;
DROP VIEW IF EXISTS vw_osm_barrierpoints;
CREATE VIEW vw_osm_barrierpoints AS SELECT geometry
FROM points WHERE barrier IN ('block', 'bollard', 'chain', 'cycle_barrier', 'spikes', 'fence', 'wire_fence','yes');

DROP VIEW IF EXISTS vw_osm_barrierways;
CREATE VIEW vw_osm_barrierways AS SELECT geometry, 
CASE 
WHEN barrier IN ('city_wall', 'fence', 'retaining_wall', 'wall', 'wire_fence', 'yes') THEN 'fence'
WHEN barrier IN ('gate', 'spikes', 'bollard', 'lift_gate', 'kissing_gate') THEN 'gate'
WHEN barrier IN ('hedge') THEN 'hedge'
END AS stylegroup FROM lines WHERE stylegroup IS NOT NULL;

DROP VIEW IF EXISTS vw_osm_buildings;
CREATE VIEW vw_osm_buildings AS SELECT geometry, ST_MinY(geometry) AS y_min FROM   multipolygons
WHERE  building IS NOT NULL OR railway IN ('station') OR aeroway IN ('terminal');

DROP VIEW IF EXISTS vw_osm_building_labels;
CREATE VIEW vw_osm_building_labels AS SELECT ST_PointOnSurface(geometry) AS geometry,
CASE
WHEN name IS NOT NULL AND addr_housenumber IS NOT NULL THEN name || ' ' || addr_housenumber
WHEN name IS NOT NULL THEN name
ELSE addr_housenumber
END AS bname
FROM multipolygons
WHERE ST_IsValid(geometry) AND building IS NOT NULL AND bname IS NOT NULL
UNION ALL SELECT geometry, CASE
WHEN addr_housename IS NOT NULL AND addr_housenumber IS NOT NULL THEN addr_housename || ' ' || addr_housenumber
WHEN addr_housename IS NOT NULL THEN addr_housename
ELSE addr_housenumber
END AS bname
FROM points
WHERE addr_housenumber IS NOT NULL OR addr_housename IS NOT NULL;

DROP VIEW IF EXISTS vw_osm_ferryways;
CREATE VIEW vw_osm_ferryways AS SELECT geometry, name FROM lines WHERE route = 'ferry';

DROP VIEW IF EXISTS vw_osm_landusages;
CREATE VIEW vw_osm_landusages AS SELECT geometry, amenity AS type, ST_Area(geometry) AS area FROM   multipolygons
WHERE  amenity IN ('university', 'school', 'college', 'library', 'fuel', 'parking', 'cinema', 'theatre', 'place_of_worship', 'hospital')
UNION ALL SELECT geometry, aeroway AS type, ST_Area(geometry) AS area FROM   multipolygons
WHERE aeroway IN ('apron', 'aerodrome', 'helipad')
UNION ALL SELECT geometry, natural AS type, ST_Area(geometry) AS area FROM   multipolygons
WHERE  natural IN ('wood', 'land', 'scrub', 'wetland')
UNION ALL SELECT geometry, highway AS type, ST_Area(geometry) AS area FROM   multipolygons
WHERE highway IN ('pedestrian', 'footway')
UNION ALL SELECT geometry, place AS type, ST_Area(geometry) AS area FROM   multipolygons
WHERE  place IN ('island')
UNION ALL SELECT geometry, landuse AS type, ST_Area(geometry) AS area FROM   multipolygons
WHERE  landuse IN ('park', 'forest', 'residential', 'retail', 'commercial', 'industrial', 'railway', 'cemetery', 'grass', 'farmyard', 'farm', 'farmland', 'wood', 'meadow', 'village_green', 'recreation_ground', 'allotments', 'quarry')
UNION ALL SELECT geometry, tourism AS type, ST_Area(geometry) AS area FROM   multipolygons
WHERE  tourism IN ('zoo')
UNION ALL SELECT geometry, leisure AS type, ST_Area(geometry) AS area FROM   multipolygons
WHERE  leisure IN ('park', 'garden', 'playground', 'golf_course', 'sports_centre', 'pitch', 'stadium', 'common', 'nature_reserve');

-- Roads

-- DROP VIEW IF EXISTS vw_osm_motorways;
-- CREATE VIEW vw_osm_motorways AS SELECT geometry, name, highway AS type, 
-- CASE
-- WHEN oneway IN ('yes', '1', 'true') THEN 1
-- WHEN oneway IN ('-1') THEN -1
-- ELSE 0
-- END AS oneway, ref, layer, z_order, access
-- FROM lines
-- WHERE highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link');
DROP VIEW IF EXISTS vw_osm_motorways;
CREATE VIEW vw_osm_motorways AS SELECT geometry, highway AS type
FROM lines
WHERE highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link');

DROP VIEW IF EXISTS vw_osm_roads_gen1;
CREATE VIEW vw_osm_roads_gen1 AS SELECT ST_SimplifyPreserveTopology(geometry, 0.0005) AS geometry, highway AS type
FROM lines
WHERE highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link', 'primary', 'secondary', 'tertiary');

DROP VIEW IF EXISTS vw_osm_roads;
CREATE VIEW vw_osm_roads AS SELECT geometry, highway AS type, name, ref, oneway, z_order, 
CASE
WHEN highway IN ('motorway', 'trunk') THEN 'motorway'
WHEN highway IN ('primary', 'secondary') THEN 'mainroad'
WHEN highway IN ('motorway_link', 'trunk_link', 'primary_link', 'secondary_link', 'tertiary', 'tertiary_link', 'residential', 'unclassified', 'road', 'living_street') THEN 'minorroad'
WHEN highway IN ('service', 'track') THEN 'service'
WHEN highway IN ('path', 'cycleway', 'footway', 'pedestrian', 'steps', 'bridleway') THEN 'noauto'
WHEN railway IN ('light_rail', 'subway', 'narrow_gauge', 'rail', 'tram') THEN 'railway'
ELSE NULL END AS stylegroup
FROM lines WHERE stylegroup IS NOT NULL AND (tunnel IS NULL OR tunnel NOT IN ('yes', '1', 'true'));

DROP VIEW IF EXISTS vw_osm_tunnels;
CREATE VIEW vw_osm_tunnels AS SELECT geometry, highway AS type, z_order, 
CASE
WHEN highway IN ('motorway', 'trunk') THEN 'motorway'
WHEN highway IN ('primary', 'secondary') THEN 'mainroad'
WHEN highway IN ('motorway_link', 'trunk_link', 'primary_link', 'secondary_link', 'tertiary', 'tertiary_link', 'residential', 'unclassified', 'road', 'living_street') THEN 'minorroad'
WHEN highway IN ('service', 'track') THEN 'service'
WHEN highway IN ('path', 'cycleway', 'footway', 'pedestrian', 'steps', 'bridleway') THEN 'noauto'
WHEN railway IN ('light_rail', 'subway', 'narrow_gauge', 'rail', 'tram') THEN 'railway'
ELSE NULL END AS stylegroup
FROM lines WHERE stylegroup IS NOT NULL AND tunnel IN ('yes', '1', 'true');

DROP VIEW IF EXISTS vw_osm_bridges;
CREATE VIEW vw_osm_bridges AS SELECT geometry, highway AS type, z_order, 
CASE
WHEN highway IN ('motorway', 'trunk') THEN 'motorway'
WHEN highway IN ('primary', 'secondary') THEN 'mainroad'
WHEN highway IN ('motorway_link', 'trunk_link', 'primary_link', 'secondary_link', 'tertiary', 'tertiary_link', 'residential', 'unclassified', 'road', 'living_street') THEN 'minorroad'
WHEN highway IN ('service', 'track') THEN 'service'
WHEN highway IN ('path', 'cycleway', 'footway', 'pedestrian', 'steps', 'bridleway') THEN 'noauto'
WHEN railway IN ('light_rail', 'subway', 'narrow_gauge', 'rail', 'tram') THEN 'railway'
ELSE NULL END AS stylegroup
FROM lines WHERE stylegroup IS NOT NULL AND bridge IN ('yes', '1', 'true');

-- Roads: done

DROP VIEW IF EXISTS vw_osm_places;
CREATE VIEW vw_osm_places AS SELECT geometry, name, place AS type, 
CASE
WHEN place = 'town' THEN 5
WHEN place = 'city' THEN 6
WHEN place = 'locality' THEN 0
WHEN place = 'country' THEN 10
WHEN place = 'region' THEN 8
WHEN place = 'hamlet' THEN 3
WHEN place = 'county' THEN 7
WHEN place = 'suburb' THEN 2
WHEN place = 'state' THEN 9
WHEN place = 'village' THEN 4
WHEN place = 'neighbourhood' THEN 1
ELSE -1
END AS z_order, 
CASE
WHEN population IS NOT NULL THEN CAST(population AS INTEGER)
ELSE 0
END AS population FROM points
WHERE  place IN ('country', 'state', 'region', 'county', 'city', 'town', 'village', 'hamlet', 'suburb', 'neighbourhood', 'locality');

DROP VIEW IF EXISTS vw_osm_railway_stations;
CREATE VIEW vw_osm_railway_stations AS SELECT geometry, name, railway
FROM points WHERE railway IN ('subway_entrance', 'station', 'halt', 'tram_stop');

DROP VIEW IF EXISTS vw_osm_turning_circles;
CREATE VIEW vw_osm_turning_circles AS SELECT geometry FROM points WHERE highway IN ('turning_circle');

DROP VIEW IF EXISTS vw_osm_waterways;
CREATE VIEW vw_osm_waterways AS SELECT geometry, name, waterway AS type FROM lines
WHERE  waterway IN ('stream', 'river', 'canal', 'drain', 'ditch')
UNION ALL SELECT geometry, name, barrier AS type FROM lines
WHERE  barrier IN ('ditch');

DROP VIEW IF EXISTS vw_osm_waterareas;
CREATE VIEW vw_osm_waterareas AS SELECT geometry, name, waterway AS type, ST_Area(geometry) AS area FROM multipolygons
WHERE waterway IN ('riverbank')
UNION ALL SELECT geometry, name, landuse AS type, ST_Area(geometry) AS area FROM multipolygons
WHERE  landuse IN ('basin', 'reservoir')
UNION ALL SELECT geometry, name, natural AS type, ST_Area(geometry) AS area FROM multipolygons
WHERE  natural IN ('water');

-----------------------------------------------------------------------------------

DROP VIEW IF EXISTS vw_osm_landusages_gen0;
CREATE VIEW vw_osm_landusages_gen0 AS
SELECT CastToMultiPolygon(ST_SimplifyPreserveTopology(geometry, 0.002)) AS geometry, type, area
FROM   vw_osm_landusages
WHERE  ST_Area(geometry)>0.000041;

DROP VIEW IF EXISTS vw_osm_landusages_gen1;
CREATE VIEW vw_osm_landusages_gen1 AS
SELECT CastToMultiPolygon(ST_SimplifyPreserveTopology(geometry, 0.0005)) AS geometry, type, area
FROM   vw_osm_landusages
WHERE  ST_Area(geometry)>0.0000041;

DROP VIEW IF EXISTS vw_osm_landusage_overlays;
CREATE VIEW vw_osm_landusage_overlays AS
SELECT geometry, type, area
FROM   vw_osm_landusages
WHERE  type IN ('nature_reserve', 'wetland');

-- DROP VIEW IF EXISTS vw_osm_motorways_gen0;
-- CREATE VIEW vw_osm_motorways_gen0 AS
-- SELECT ST_SimplifyPreserveTopology(geometry, 0.0018) AS geometry, name, type, oneway, ref, layer, z_order, access
-- FROM   vw_osm_motorways;

DROP VIEW IF EXISTS vw_osm_motorways_gen0;
CREATE VIEW vw_osm_motorways_gen0 AS
SELECT ST_SimplifyPreserveTopology(geometry, 0.002) AS geometry, type
FROM   vw_osm_motorways;

-- DROP VIEW IF EXISTS vw_osm_motorways_gen1;
-- CREATE VIEW vw_osm_motorways_gen1 AS
-- SELECT ST_SimplifyPreserveTopology(geometry, 0.00045) AS geometry, name, type, oneway, ref, layer, z_order, access
-- FROM   vw_osm_motorways;

-----------------------------------------------------------------------------------

SELECT date(), time(), 'Materializing view vw_osm_admin';
CREATE TABLE osm_admin AS SELECT * FROM vw_osm_admin;
SELECT date(), time(), 'Recovering column osm_admin.geometry';
SELECT RecoverGeometryColumn('osm_admin', 'geometry', 4326, 'MULTIPOLYGON');
SELECT date(), time(), 'Indexing column osm_admin.geometry';
SELECT CreateSpatialIndex('osm_admin', 'geometry');        

SELECT date(), time(), 'Materializing view vw_osm_aeroways';
CREATE TABLE osm_aeroways AS SELECT * FROM vw_osm_aeroways;
SELECT date(), time(), 'Recovering column osm_aeroways.geometry';
SELECT RecoverGeometryColumn('osm_aeroways', 'geometry', 4326, 'LINESTRING');
SELECT date(), time(), 'Indexing column osm_aeroways.geometry';
SELECT CreateSpatialIndex('osm_aeroways', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_airports';
CREATE TABLE osm_airports AS SELECT * FROM vw_osm_airports;
SELECT date(), time(), 'Recovering column osm_airports.geometry';
SELECT RecoverGeometryColumn('osm_airports', 'geometry', 4326, 'POINT');
SELECT date(), time(), 'Indexing column osm_airports.geometry';
SELECT CreateSpatialIndex('osm_airports', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_amenity_gen0';
CREATE TABLE osm_amenity_gen0 AS SELECT * FROM vw_osm_amenity_gen0;
SELECT date(), time(), 'Recovering column osm_amenity_gen0.geometry';
SELECT RecoverGeometryColumn('osm_amenity_gen0', 'geometry', 4326, 'POINT');
SELECT date(), time(), 'Indexing column osm_amenity_gen0.geometry';
SELECT CreateSpatialIndex('osm_amenity_gen0', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_amenity_gen1';
CREATE TABLE osm_amenity_gen1 AS SELECT * FROM vw_osm_amenity_gen1;
SELECT date(), time(), 'Recovering column osm_amenity_gen1.geometry';
SELECT RecoverGeometryColumn('osm_amenity_gen1', 'geometry', 4326, 'POINT');
SELECT date(), time(), 'Indexing column osm_amenity_gen1.geometry';
SELECT CreateSpatialIndex('osm_amenity_gen1', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_amenity_gen2';
CREATE TABLE osm_amenity_gen2 AS SELECT * FROM vw_osm_amenity_gen2;
SELECT date(), time(), 'Recovering column osm_amenity_gen2.geometry';
SELECT RecoverGeometryColumn('osm_amenity_gen2', 'geometry', 4326, 'POINT');
SELECT date(), time(), 'Indexing column osm_amenity_gen2.geometry';
SELECT CreateSpatialIndex('osm_amenity_gen2', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_amenity_points';
CREATE TABLE osm_amenity_points AS SELECT * FROM vw_osm_amenity_points;
SELECT date(), time(), 'Recovering column osm_amenity_points.geometry';
SELECT RecoverGeometryColumn('osm_amenity_points', 'geometry', 4326, 'POINT');
SELECT date(), time(), 'Indexing column osm_amenity_points.geometry';
SELECT CreateSpatialIndex('osm_amenity_points', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_amenity_fuel';
CREATE TABLE osm_amenity_fuel AS SELECT * FROM vw_osm_amenity_fuel;
SELECT date(), time(), 'Recovering column osm_amenity_fuel.geometry';
SELECT RecoverGeometryColumn('osm_amenity_fuel', 'geometry', 4326, 'POINT');
SELECT date(), time(), 'Indexing column osm_amenity_fuel.geometry';
SELECT CreateSpatialIndex('osm_amenity_fuel', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_area_labels';
CREATE TABLE osm_area_labels AS SELECT * FROM vw_osm_area_labels;
SELECT date(), time(), 'Recovering column osm_area_labels.geometry';
SELECT RecoverGeometryColumn('osm_area_labels', 'geometry', 4326, 'POINT');
SELECT date(), time(), 'Indexing column osm_area_labels.geometry';
SELECT CreateSpatialIndex('osm_area_labels', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_barrierpoints';
CREATE TABLE osm_barrierpoints AS SELECT * FROM vw_osm_barrierpoints;
SELECT date(), time(), 'Recovering column osm_barrierpoints.geometry';
SELECT RecoverGeometryColumn('osm_barrierpoints', 'geometry', 4326, 'POINT');
SELECT date(), time(), 'Indexing column osm_barrierpoints.geometry';
SELECT CreateSpatialIndex('osm_barrierpoints', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_barrierways';
CREATE TABLE osm_barrierways AS SELECT * FROM vw_osm_barrierways;
SELECT date(), time(), 'Recovering column osm_barrierways.geometry';
SELECT RecoverGeometryColumn('osm_barrierways', 'geometry', 4326, 'LINESTRING');
SELECT date(), time(), 'Indexing column osm_barrierways.geometry';
SELECT CreateSpatialIndex('osm_barrierways', 'geometry');
        
SELECT date(), time(), 'Materializing view vw_osm_buildings';
CREATE TABLE osm_buildings AS SELECT * FROM vw_osm_buildings;
SELECT date(), time(), 'Recovering column osm_buildings.geometry';
SELECT RecoverGeometryColumn('osm_buildings', 'geometry', 4326, 'MULTIPOLYGON');
SELECT date(), time(), 'Indexing column osm_buildings.geometry';
SELECT CreateSpatialIndex('osm_buildings', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_building_labels';
CREATE TABLE osm_building_labels AS SELECT * FROM vw_osm_building_labels;
SELECT date(), time(), 'Recovering column osm_building_labels.geometry';
SELECT RecoverGeometryColumn('osm_building_labels', 'geometry', 4326, 'POINT');
SELECT date(), time(), 'Indexing column osm_building_labels.geometry';
SELECT CreateSpatialIndex('osm_building_labels', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_ferryways';
CREATE TABLE osm_ferryways AS SELECT * FROM vw_osm_ferryways;
SELECT date(), time(), 'Recovering column osm_ferryways.geometry';
SELECT RecoverGeometryColumn('osm_ferryways', 'geometry', 4326, 'LINESTRING');
SELECT date(), time(), 'Indexing column osm_ferryways.geometry';
SELECT CreateSpatialIndex('osm_ferryways', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_landusages_gen0';
CREATE TABLE osm_landusages_gen0 AS SELECT * FROM vw_osm_landusages_gen0;
SELECT date(), time(), 'Recovering column osm_landusages_gen0.geometry';
SELECT RecoverGeometryColumn('osm_landusages_gen0', 'geometry', 4326, 'MULTIPOLYGON');
SELECT date(), time(), 'Indexing column osm_landusages_gen0.geometry';
SELECT CreateSpatialIndex('osm_landusages_gen0', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_landusages_gen1';
CREATE TABLE osm_landusages_gen1 AS SELECT * FROM vw_osm_landusages_gen1;
SELECT date(), time(), 'Recovering column osm_landusages_gen1.geometry';
SELECT RecoverGeometryColumn('osm_landusages_gen1', 'geometry', 4326, 'MULTIPOLYGON');
SELECT date(), time(), 'Indexing column osm_landusages_gen1.geometry';
SELECT CreateSpatialIndex('osm_landusages_gen1', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_landusages';
CREATE TABLE osm_landusages AS SELECT * FROM vw_osm_landusages;
SELECT date(), time(), 'Recovering column osm_landusages.geometry';
SELECT RecoverGeometryColumn('osm_landusages', 'geometry', 4326, 'MULTIPOLYGON');
SELECT date(), time(), 'Indexing column osm_landusages.geometry';
SELECT CreateSpatialIndex('osm_landusages', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_landusage_overlays';
CREATE TABLE osm_landusage_overlays AS SELECT * FROM vw_osm_landusage_overlays;
SELECT date(), time(), 'Recovering column osm_landusage_overlays.geometry';
SELECT RecoverGeometryColumn('osm_landusage_overlays', 'geometry', 4326, 'MULTIPOLYGON');
SELECT date(), time(), 'Indexing column osm_landusage_overlays.geometry';
SELECT CreateSpatialIndex('osm_landusage_overlays', 'geometry');

-- Motorways and roads

-- SELECT date(), time(), 'Materializing view vw_osm_motorways';
-- CREATE TABLE osm_motorways AS SELECT * FROM vw_osm_motorways;
-- SELECT date(), time(), 'Recovering column osm_motorways.geometry';
-- SELECT RecoverGeometryColumn('osm_motorways', 'geometry', 4326, 'LINESTRING');
-- SELECT date(), time(), 'Indexing column osm_motorways.geometry';
-- SELECT CreateSpatialIndex('osm_motorways', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_motorways_gen0';
CREATE TABLE osm_motorways_gen0 AS SELECT * FROM vw_osm_motorways_gen0;
SELECT date(), time(), 'Recovering column osm_motorways_gen0.geometry';
SELECT RecoverGeometryColumn('osm_motorways_gen0', 'geometry', 4326, 'LINESTRING');
SELECT date(), time(), 'Indexing column osm_motorways_gen0.geometry';
SELECT CreateSpatialIndex('osm_motorways_gen0', 'geometry');

-- SELECT date(), time(), 'Materializing view vw_osm_motorways_gen1';
-- CREATE TABLE osm_motorways_gen1 AS SELECT * FROM vw_osm_motorways_gen1;
-- SELECT date(), time(), 'Recovering column osm_motorways_gen1.geometry';
-- SELECT RecoverGeometryColumn('osm_motorways_gen1', 'geometry', 4326, 'LINESTRING');
-- SELECT date(), time(), 'Indexing column osm_motorways_gen1.geometry';
-- SELECT CreateSpatialIndex('osm_motorways_gen1', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_roads_gen1';
CREATE TABLE osm_roads_gen1 AS SELECT * FROM vw_osm_roads_gen1;
SELECT date(), time(), 'Recovering column osm_roads_gen1.geometry';
SELECT RecoverGeometryColumn('osm_roads_gen1', 'geometry', 4326, 'LINESTRING');
SELECT date(), time(), 'Indexing column osm_roads_gen1.geometry';
SELECT CreateSpatialIndex('osm_roads_gen1', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_roads';
CREATE TABLE osm_roads AS SELECT * FROM vw_osm_roads;
SELECT date(), time(), 'Recovering column osm_roads.geometry';
SELECT RecoverGeometryColumn('osm_roads', 'geometry', 4326, 'LINESTRING');
SELECT date(), time(), 'Indexing column osm_roads.geometry';
SELECT CreateSpatialIndex('osm_roads', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_tunnels';
CREATE TABLE osm_tunnels AS SELECT * FROM vw_osm_tunnels;
SELECT date(), time(), 'Recovering column osm_tunnels.geometry';
SELECT RecoverGeometryColumn('osm_tunnels', 'geometry', 4326, 'LINESTRING');
SELECT date(), time(), 'Indexing column osm_tunnels.geometry';
SELECT CreateSpatialIndex('osm_tunnels', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_bridges';
CREATE TABLE osm_bridges AS SELECT * FROM vw_osm_bridges;
SELECT date(), time(), 'Recovering column osm_bridges.geometry';
SELECT RecoverGeometryColumn('osm_bridges', 'geometry', 4326, 'LINESTRING');
SELECT date(), time(), 'Indexing column osm_bridges.geometry';
SELECT CreateSpatialIndex('osm_bridges', 'geometry');

-- Motorways and roads: done

SELECT date(), time(), 'Materializing view vw_osm_places';
CREATE TABLE osm_places AS SELECT * FROM vw_osm_places;
SELECT date(), time(), 'Recovering column osm_places.geometry';
SELECT RecoverGeometryColumn('osm_places', 'geometry', 4326, 'POINT');
SELECT date(), time(), 'Indexing column osm_places.geometry';
SELECT CreateSpatialIndex('osm_places', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_railway_stations';
CREATE TABLE osm_railway_stations AS SELECT * FROM vw_osm_railway_stations;
SELECT date(), time(), 'Recovering column osm_railway_stations.geometry';
SELECT RecoverGeometryColumn('osm_railway_stations', 'geometry', 4326, 'POINT');
SELECT date(), time(), 'Indexing column osm_railway_stations.geometry';
SELECT CreateSpatialIndex('osm_railway_stations', 'geometry');


SELECT date(), time(), 'Materializing view vw_osm_turning_circles';
CREATE TABLE osm_turning_circles AS SELECT * FROM vw_osm_turning_circles;
SELECT date(), time(), 'Recovering column osm_turning_circles.geometry';
SELECT RecoverGeometryColumn('osm_turning_circles', 'geometry', 4326, 'POINT');
SELECT date(), time(), 'Indexing column osm_turning_circles.geometry';
SELECT CreateSpatialIndex('osm_turning_circles', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_waterareas';
CREATE TABLE osm_waterareas AS SELECT * FROM vw_osm_waterareas;
SELECT date(), time(), 'Recovering column osm_waterareas.geometry';
SELECT RecoverGeometryColumn('osm_waterareas', 'geometry', 4326, 'MULTIPOLYGON');
SELECT date(), time(), 'Indexing column osm_waterareas.geometry';
SELECT CreateSpatialIndex('osm_waterareas', 'geometry');

SELECT date(), time(), 'Materializing view vw_osm_waterways';
CREATE TABLE osm_waterways AS SELECT * FROM vw_osm_waterways;
SELECT date(), time(), 'Recovering column osm_waterways.geometry';
SELECT RecoverGeometryColumn('osm_waterways', 'geometry', 4326, 'LINESTRING');
SELECT date(), time(), 'Indexing column osm_waterways.geometry';
SELECT CreateSpatialIndex('osm_waterways', 'geometry');

-- Create indexes to ensure fast startup of Mapnik (needed if we use ORDER in table queries)
CREATE INDEX index_osm_landusages_gen0 ON osm_landusages_gen0(area);
CREATE INDEX index_osm_landusages_gen1 ON osm_landusages_gen1(area);
CREATE INDEX index_osm_landusages ON osm_landusages(area);
CREATE INDEX index_osm_landusage_overlays ON osm_landusage_overlays(area);
CREATE INDEX index_osm_buildings ON osm_buildings(y_min);
CREATE INDEX index_osm_tunnels ON osm_tunnels(z_order);
CREATE INDEX index_osm_roads ON osm_roads(z_order);
CREATE INDEX index_osm_bridges ON osm_bridges(z_order);
CREATE INDEX index_osm_places ON osm_places(z_order, population);
CREATE INDEX index_osm_area_labels ON osm_area_labels(area);
------------------------------------------------------------------

CREATE TABLE mapnik_metadata (f_table_name TEXT, xmin REAL, ymin REAL, xmax REAL, ymax REAL);

DROP VIEW vw_osm_admin;
DROP VIEW vw_osm_aeroways;
DROP VIEW vw_osm_airports;
DROP VIEW vw_osm_amenity_gen0;
DROP VIEW vw_osm_amenity_gen1;
DROP VIEW vw_osm_amenity_gen2;
DROP VIEW vw_osm_amenity_points;
DROP VIEW vw_osm_amenity_fuel;
DROP VIEW vw_osm_area_labels;
DROP VIEW vw_osm_barrierpoints;
DROP VIEW vw_osm_barrierways;
DROP VIEW vw_osm_buildings;
DROP VIEW vw_osm_building_labels;
DROP VIEW vw_osm_ferryways;
DROP VIEW vw_osm_landusages_gen0;
DROP VIEW vw_osm_landusages_gen1;
DROP VIEW vw_osm_landusages;
DROP VIEW vw_osm_landusage_overlays;

DROP VIEW vw_osm_motorways;
DROP VIEW vw_osm_motorways_gen0;
--DROP VIEW vw_osm_motorways_gen1;
DROP VIEW vw_osm_roads_gen1;
DROP VIEW vw_osm_roads;
DROP VIEW vw_osm_tunnels;
DROP VIEW vw_osm_bridges;

DROP VIEW vw_osm_places;
DROP VIEW vw_osm_railway_stations;
DROP VIEW vw_osm_turning_circles;
DROP VIEW vw_osm_waterareas;
DROP VIEW vw_osm_waterways;

SELECT date(), time(), 'Cleanup by dropping non-required tables and running VACUUM';

SELECT DiscardGeometryColumn('points', 'GEOMETRY');
SELECT DiscardGeometryColumn('lines', 'GEOMETRY');
SELECT DiscardGeometryColumn('multilinestrings', 'GEOMETRY');
SELECT DiscardGeometryColumn('multipolygons', 'GEOMETRY');
SELECT DiscardGeometryColumn('other_relations', 'GEOMETRY');

DROP TABLE points;
DROP TABLE lines;
DROP TABLE multilinestrings;
DROP TABLE multipolygons;
DROP TABLE other_relations;
DROP TABLE tmp_osm_amenity_ids;

VACUUM;
