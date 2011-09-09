
Map { background-color:@water; }

#water_gen0[zoom>3][zoom<=9],
#water_gen1[zoom>9][zoom<=12],
#water[zoom>12] {
  polygon-fill:@water;
}

/* ---- Waterways ------------------------------------------------- */

#waterway[type='river'][zoom>5] {
  line-color:@water;
  line-cap:round;
  line-join:round;
  [zoom=6] { line-width:0.15; }
  [zoom=7] { line-width:0.25; }
  [zoom=8] { line-width:0.5; }
  [zoom=9] { line-width:1; }
  [zoom=10]{ line-width:1; }
  [zoom=11]{ line-width:2; }
  [zoom=12]{ line-width:2; }
  [zoom=13]{ line-width:3; }
  [zoom=14]{ line-width:3; }
  [zoom=15]{ line-width:4; }
  [zoom=16]{ line-width:5; }
  [zoom=17]{ line-width:6; }
  [zoom>17]{ line-width:7; }
}

#waterway[type='stream'][zoom>9] {
  line-color:@water;
  line-cap:round;
  line-join:round;
  [zoom=10]{ line-width:0.5; }
  [zoom=11]{ line-width:0.5; }
  [zoom=12]{ line-width:1; }
  [zoom=13]{ line-width:1; }
  [zoom>13]{ line-width:2; }
}

#waterway[type='canal'][zoom>9] {
  line-color:@water;
  line-cap:round;
  line-join:round;
  [zoom=10]{ line-width:0.5; }
  [zoom=11]{ line-width:0.5; }
  [zoom=12]{ line-width:1; }
  [zoom=13]{ line-width:1; }
  [zoom=14]{ line-width:2; }
  [zoom=15]{ line-width:4; }
  [zoom=16]{ line-width:8; }
  [zoom=17]{ line-width:16; }
  [zoom>17]{ line-width:30; }
}


/* ==== LANDUSE & LANDCOVER ======================================= */

#land {
  polygon-fill:@land;
  polygon-gamma:0.75;
}

#landuse_gen0[zoom>3][zoom<=9],
#landuse_gen1[zoom>9][zoom<=12],
#landuse[zoom>12] {
  [type='cemetery']      { polygon-fill:@cemetery; }
  [type='college']       { polygon-fill:@school; }
  [type='commercial']    { polygon-fill:@industrial; }
  [type='forest']        { polygon-fill:@forest; }
  [type='golf_course']   { polygon-fill:@park; }
  [type='hospital']      { polygon-fill:@hospital; }
  [type='industrial']    { polygon-fill:@industrial; }
  /*[type='nature_reserve']{ polygon-fill:@park; }*/
  [type='park']          { polygon-fill:@park; }
  [type='parking']       { polygon-fill:@industrial; }
  [type='pedestrian']    { polygon-fill:@pedestrian_fill; }
  [type='pitch']         { polygon-fill:@sports; }
  [type='residential']   { polygon-fill:@residential; }
  [type='school']        { polygon-fill:@school; }
  [type='sports_center'] { polygon-fill:@sports; }
  [type='stadium']       { polygon-fill:@sports; }
  [type='university']    { polygon-fill:@school; }
  [type='wood']          { polygon-fill:@forest; }
}

#landuse_overlays[type='nature_reserve'][zoom>3] {
  line-color:#396;
  line-opacity: 0.25;
  [zoom=4] { line-width:0.4; }
  [zoom=5] { line-width:0.6; }
  [zoom=6] { line-width:0.8; }
  [zoom=7] { line-width:1.0; }
  [zoom=8] { line-width:1.5; }
  [zoom=9] { line-width:2.0; }
}

#transport_areas[zoom>3] {
  polygon-fill:@transport;
}

/* ==== WATER LABELS ============================================== */

#water_label[zoom>10][area>1600000],
#water_label[zoom>11][area>4000000],
#water_label[zoom>12][area>1000000],
#water_label[zoom>13][area>500000],
#water_label[zoom>14][area>250000],
#water_label[zoom>15][area>125000],
#water_label[zoom>16][area>612500],
#water_label[zoom>17] {
  text-name:'[name]';
  text-face-name:@sans;
  text-fill:darken(@water,30);
  text-halo-fill:#fff;
  text-halo-radius:2;
  text-placement:interior;
  text-size:11;
  text-wrap-width:20;
}

#waterway_label[type='river'][zoom>5],
#waterway_label[type='canal'][zoom>9],
#waterway_label[type='stream'][zoom>11] {
  text-name:'[name]';
  text-face-name:@sans;
  text-fill:darken(@water,20);
  text-halo-fill:#fff;
  text-halo-radius:2;
  text-placement:line;
  text-min-distance:400;
  text-size:10;
}
