/*******************************************************************************
# Elements relating to air transportation.

## Contents
  1. aeroways
  2. labels & icons
*******************************************************************************/

/* ---- aeroways ------------------------------------------------------------ */

.aero.line.main[aeroway='runway'][zoom>=11],
.aero.line.main[aeroway='taxiway'][zoom>=11] {
  line-cap: butt;
  line-color: #f4f4f4;
}

.aero.poly[aeroway='helipad'][zoom>=11],
.aero.poly[aeroway='runway'][zoom>=11],
.aero.poly[aeroway='taxiway'][zoom>=11] { polygon-fill: #f4f4f4; }

/* Runways */
.aero.line[aeroway='runway'][zoom=11] { line-width: 2; }
.aero.line[aeroway='runway'][zoom=12] { line-width: 4; }
.aero.line[aeroway='runway'][zoom=13] { line-width: 6; }
.aero.line[aeroway='runway'][zoom=14] { line-width: 12; }
.aero.line[aeroway='runway'][zoom=15] { line-width: 18; }
.aero.line[aeroway='runway'][zoom=16] { line-width: 24; }
.aero.line[aeroway='runway'][zoom=17] { line-width: 30; }
.aero.line[aeroway='runway'][zoom=18] { line-width: 36; }

/* Taxiways */
.aero.line[aeroway='taxiway'][zoom=11] { line-width: 1; }
.aero.line[aeroway='taxiway'][zoom=12] { line-width: 2; }
.aero.line[aeroway='taxiway'][zoom=13] { line-width: 4; }
.aero.line[aeroway='taxiway'][zoom=14] { line-width: 6; }
.aero.line[aeroway='taxiway'][zoom=15] { line-width: 8; }
.aero.line[aeroway='taxiway'][zoom=16] { line-width: 10; }
.aero.line[aeroway='taxiway'][zoom=17] { line-width: 12; }
.aero.line[aeroway='taxiway'][zoom=18] { line-width: 16; }

/* Aprons - parking areas for airplanes */
.aero.line[aeroway='apron'][zoom>=11] {
  line-cap: butt;
  line-color: #f0f0f0;
}

.aero.line[aeroway='apron'][zoom=11] { line-width: 1; }
.aero.line[aeroway='apron'][zoom=12] { line-width: 2; }
.aero.line[aeroway='apron'][zoom=13] { line-width: 4; }
.aero.line[aeroway='apron'][zoom=14] { line-width: 6; }
.aero.line[aeroway='apron'][zoom=15] { line-width: 8; }
.aero.line[aeroway='apron'][zoom=16] { line-width: 10; }
.aero.line[aeroway='apron'][zoom=17] { line-width: 12; }
.aero.line[aeroway='apron'][zoom=18] { line-width: 16; }

.aero.poly[aeroway='apron'][zoom>=11] { polygon-fill: #f0f0f0; }

/* Outlines */
/*.aero.line.outer[aeroway='runway'][zoom>=11],
.aero.line.outer[aeroway='taxiway'][zoom>=11],
.aero.line.outer[aeroway='apron'][zoom>=11] {
  line-opacity: 0;
  outline-color: #fff;
  outline-opacity: 0.1;
  outline-width: 1;
}

.aero.poly[aeroway='runway'][zoom>=11],
.aero.poly[aeroway='taxiway'][zoom>=11],
.aero.poly[aeroway='apron'][zoom>=11] {
  line-color: #fff;
  line-width: 1;
}*/

/* ---- labels & icons ------------------------------------------------------ */

.aero.label[aeroway='aerodrome'][zoom>=12] name {
  text-allow-overlap: false;
  text-dy: 7;
  text-face-name: 'Arial Regular';
  text-fill: #888;
  text-halo-fill: #fff;
  text-halo-radius: 1;
  text-line-spacing: 1;
  text-min-distance: 20;
  text-placement: point;
  text-wrap-width: 70;
}

.aero.label[aeroway='aerodrome'][zoom=12] name { text-size: 9; }
.aero.label[aeroway='aerodrome'][zoom=13] name { text-size: 10; }
.aero.label[aeroway='aerodrome'][zoom=14] name { text-size: 11; }
.aero.label[aeroway='aerodrome'][zoom>=15] name { text-size: 12; text-line-spacing: 2; }

.aero.label[zoom>=12][aeroway='aerodrome'] { point-file: url(res/airport-10.png); }
.aero.label[zoom>=15][aeroway='aerodrome'] { point-file: url(res/airport-15.png); }

.aero.label[zoom>=12][aeroway='helipad'] { point-file: url(res/helipad-10.png); }
.aero.label[zoom>=15][aeroway='helipad'] { point-file: url(res/helipad-15.png); }