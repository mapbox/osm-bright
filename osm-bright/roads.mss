/* "Roads", including highways, railways, aeroways, tracks, bicycle
 * & pedestrian ways.
 *
 * CONTENTS:
 *   1. Road Colors & Line Styles
 *   2. Road Widths
 *   3. Road Labels
 *   4. Railways
 *   5. Aeroways
 */

/* == 1. ROAD COLORS & LINE STYLES ================================== */

/* Note that the ordering of certain styles in this section is
   important to the rendered result. ::line should rendered below
   ::case which should be rendered below ::fill.

/* ---- Bridge Setup ------------------------------------------------ */
/* Bridges appear above roads, but complex multi-level layering 
   does not work properly yet. */
#bridge::case {
  [zoom>12] {
    line-color:@bridge_case;
    line-cap:butt;
    line-join:round;
    line-width:0;
  }
}
#bridge::fill { line-width:0; }

/* ---- Colors by road type ----------------------------------------- */
/* Roads - including tunnels */
#roads_low[zoom>=5][zoom<=7],
#roads_med[zoom>=8][zoom<=10], 
#roads_high[zoom>=11] {
  ::line, ::case, ::fill {
    line-cap:round;
    line-join:round;
    line-width:0; /* Hides roads that have no further width set */
  }
  [type='tertiary'], [type='tertiary_link'],
  [type='residential'], [type='living_street'], [type='road'],
  [type='unclassified'], [type='unknown'], [type='service'] {
    ::line { line-color:@standard_line; }
    ::case { line-color:@standard_case; }
    ::fill { line-color:@standard_fill; }
  }
  [type='secondary'], [type='secondary_link'] {
    ::line { line-color:@secondary_line; }
    ::case { line-color:@secondary_case; }
    ::fill { line-color:@secondary_fill; }
  }
  [type='primary'], [type='primary_link'] {
    ::line { line-color:@primary_line; }
    ::case { line-color:@primary_case; }
    ::fill { line-color:@primary_fill; }
  }
  [type='trunk'], [type='trunk_link'] {
    ::line { line-color:@trunk_line; }
    ::case { line-color:@trunk_case; }
    ::fill { line-color:@trunk_fill; }
  }
  [type='motorway'], [type='motorway_link'] {    
    ::line { line-color:@motorway_line; }
    ::case { line-color:@motorway_case; }
    ::fill { line-color:@motorway_fill; }
  }
}
/* Bridges */
#bridge::case[zoom>=13] { line-width:0; }
#bridge::fill[zoom>=13] {
  line-cap:round;
  line-join:round;
  [type='motorway'], [type='motorway_link'] {
    line-color:@motorway_fill;
  }
  [type='trunk'], [type='trunk_link'] {
    line-color:@trunk_fill;
  }
  [type='primary'], [type='primary_link'] {
    line-color:@primary_fill;
  }
  [type='secondary'], [type='secondary_link'] {
    line-color:@secondary_fill;
  }
  [type='tertiary'], [type='tertiary_link'],
  [type='residential'], [type='living_street'],
  [type='road'], [type='unclassified'], [type='unknown'] {
    line-color:@standard_fill;
  }
  [type='service'] {
    line-color:@standard_fill;
  }
}
/* turning circles - note that the style perhaps unsafely assumes that 
 * these are not on major roads, bridges, or tunnels.
 */
#turning_circle_case[zoom>=14] {
  marker-fill:@standard_fill;
  marker-line-color:@standard_case;
  marker-line-width:2;
  marker-allow-overlap:true;
}
#turning_circle_fill[zoom>=14] {
  marker-fill:@standard_fill;
  marker-line-width:0;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}

/* = 2. ROAD WIDTHS =============================================== */

/* Grouped by zoom-level, then type. Order low to high priority. 
   The math functions used in the casing line width definitions are
   not technically necessary, but are there to better show how much 
   of an outline is provided. (eg. A 1px outline on both sides of a
   3px line is `line-width: 3+2;`.) */

/* ---- Zoom level 5 ---------------------------------------------- */
#roads_low[zoom=7] {
  [type='trunk'],
  [type='motorway'] {
    ::line { line-width: 0.3; }
  }
}

/* ---- Zoom level 6 ---------------------------------------------- */
#roads_low[zoom=6] {
  [type='trunk'],
  [type='motorway'] {
    ::line { line-width: 0.4; }
  }
}

/* ---- Zoom level 7 ---------------------------------------------- */
#roads_low[zoom=7] {
  [type='primary'] {
    ::line { line-width: 0.2; }
  }
  [type='trunk'],
  [type='motorway'] {
    ::line { line-width: 0.5; }
  }
}

/* ---- Zoom level 8 ---------------------------------------------- */
#roads_med[zoom=8] {
  [type='secondary'] {
    ::line { line-width: 0.3; }
  }
  [type='primary'] {
    ::line { line-width: 0.4; }
  }
  [type='trunk'],
  [type='motorway'] {
    ::line { line-width: 0.6; }
  }
}

/* ---- Zoom level 9 ---------------------------------------------- */
#roads_med[zoom=9] {
  [type='secondary'] {
    ::line { line-width: 0.5; }
  }
  [type='primary'] {
    ::line { line-width: 0.6; }
  }
  [type='trunk'],
  [type='motorway'] {
    ::line { line-width: 0.8; }
  }
}

/* ---- Zoom level 10 --------------------------------------------- */
#roads_med[zoom=10] {
  [type='secondary'] {
    ::line { line-width: 0.7; }
  }
  [type='primary'] {
    ::line { line-width: 0.8; }
  }
  [type='trunk'],
  [type='motorway'] {
    ::line { line-width: 1; }
  }
}

/* ---- Zoom level 11 --------------------------------------------- */
/* Note that from zoom 11+ we are using full-resolution roads */
#roads_high[zoom=11] {
  [type='tertiary'], [type='tertiary_link'],
  [type='residential'], [type='living_street'],
  [type='road'], [type='unclassified'], [type='unknown'] {
    ::line { line-width: 0.25; }
  }
  [type='secondary'] {
    ::line { line-width: 0.9; }
  }
  [type='primary'] {
    ::line { line-width: 1; }
  }
  [type='trunk'],
  [type='motorway'] {
    ::case { line-width: 1+1.8; }
    ::fill { line-width: 1; }
  }
}

/* ---- Zoom level 12 --------------------------------------------- */
#roads_high[zoom=12] {
  [type='tertiary'], [type='tertiary_link'],
  [type='residential'], [type='living_street'],
  [type='road'], [type='unclassified'], [type='unknown'] {
    ::line { line-width: 0.5; }
  }
  [type='secondary_link'] {
    ::line { line-width: 0.8; }
  }
  [type='primary_link'] {
    ::line { line-width: 0.8; }
  }
  [type='trunk_link'] {
    ::case { line-width: 1+2; }
    ::fill { line-width: 1; }
  }
  [type='motorway_link'] {
    ::case { line-width: 1+2; }
    ::fill { line-width: 1; }
  }
  [type='secondary'] {
    ::line { line-width: 1; }
  }
  [type='primary'] {
    ::line { line-width: 1.2; }
  }
  [type='trunk'],
  [type='motorway'] {
    ::case { line-width: 1.2+1.8; }
    ::fill { line-width: 1.2; }
  }
}

/* ---- Zoom level 13 --------------------------------------------- */
#roads_high[zoom=13] {
  [type='service'] {
    ::line { line-width: 0.25; }
  }
  [type='tertiary'], [type='tertiary_link'],
  [type='residential'], [type='living_street'],
  [type='road'], [type='unclassified'], [type='unknown'] {
    ::line { line-width: 1; }
  }
  [type='secondary_link'],
  [type='primary_link'] {
    ::case { line-width: 1+2; }
    ::fill { line-width: 1; }
  }
  [type='trunk_link'] {
    ::case { line-width: 1+2; }
    ::fill { line-width: 1; }
  }
  [type='motorway_link'] {
    ::case { line-width: 1+2; }
    ::fill { line-width: 1; }
  }
  [type='secondary'] {
    ::case { line-width: 1.2+2; }
    ::fill { line-width: 1.2; }
  }
  [type='primary'] {
    ::case { line-width: 1.4+2; }
    ::fill { line-width: 1.4; }
  }
  [type='trunk'],
  [type='motorway'] {
    ::case { line-width: 2+2; }
    ::fill { line-width: 2; }
  }
}

/* ---- Zoom level 14 --------------------------------------------- */
#roads_high[zoom=14],
#bridge[zoom=14] {
  [type='service'] {
    ::line { line-width:0.7; }
  }
  [type='tertiary'], [type='tertiary_link'],
  [type='residential'], [type='living_street'],
  [type='road'], [type='unclassified'], [type='unknown'] {
    ::case { line-width: 2+1.5; }
    ::fill { line-width: 2; }
  }
  [type='secondary_link'],
  [type='primary_link'] {
    ::case { line-width: 1.5+2; }
    ::fill { line-width: 1.5; }
  }
  [type='trunk_link'] {
    ::case { line-width: 2+2; }
    ::fill { line-width: 2; }
  }
  [type='motorway_link'] {
    ::case { line-width: 2+2; }
    ::fill { line-width: 2; }
  }
  [type='secondary'] {
    ::case { line-width: 2.6+2; }
    ::fill { line-width: 2.6; }
  }
  [type='primary'] {
    ::case { line-width: 3+2; }
    ::fill { line-width: 3; }
  }
  [type='trunk'],
  [type='motorway'] {
    ::case { line-width: 3+2; }
    ::fill { line-width: 3; }
  }
}
#turning_circle_case,
#turning_circle_fill { [zoom=14] { marker-width:2; } }

/* ---- Zoom level 15 --------------------------------------------- */
#roads_high[zoom=15],
#bridge[zoom=15] {
  [type='service'] {
    ::line { line-width:1.5; }
  }
  [type='tertiary'], [type='tertiary_link'],
  [type='residential'], [type='living_street'],
  [type='road'], [type='unclassified'], [type='unknown'] {
    ::case { line-width:2+2; }
    ::fill { line-width:2; }
  }
  [type='secondary_link'],
  [type='primary_link'] {
    ::case { line-width:1.5+2; }
    ::fill { line-width:1.5; }
  }
  [type='trunk_link'] {
    ::case { line-width:3+2; }
    ::fill { line-width:3; }
  }
  [type='motorway_link'] {
    ::case { line-width:3+2; }
    ::fill { line-width:3; }
  }
  [type='secondary'] {
    ::case { line-width:4+2; }
    ::fill { line-width:4; }
  }
  [type='primary'] {
    ::case { line-width:5+2; }
    ::fill { line-width:5; }
  }
  [type='trunk'],
  [type='motorway'] {
    ::case { line-width:6+2; }
    ::fill { line-width:6; }
  }
}
.turning_circle[zoom=15] { marker-width:2.5; }

/* ---- Zoom level 16 --------------------------------------------- */
#roads_high[zoom=16],
#bridge[zoom=16] {
  [type='service'] {
    ::case { line-width: 1.5+2; }
    ::fill { line-width: 1.5; }
  }
  [type='tertiary'], [type='tertiary_link'],
  [type='residential'], [type='living_street'],
  [type='road'], [type='unclassified'], [type='unknown'] {
    ::case { line-width:4+2; }
    ::fill { line-width:4; }
  }
  [type='secondary_link'],
  [type='primary_link'] {
    ::case { line-width: 3+2.5; }
    ::fill { line-width: 3; }
  }
  [type='trunk_link'],
  [type='motorway_link'] {
    ::case { line-width:4+2; }
    ::fill { line-width:4; }
  }
  [type='secondary'] {
    ::case { line-width: 6+2.5; }
    ::fill { line-width: 6; }
  }
  [type='primary'] {
    ::case { line-width: 7+2.5; }
    ::fill { line-width: 7; }
  }
  [type='trunk'],
  [type='motorway'] {
    ::case { line-width: 8+2.5; }
    ::fill { line-width: 8; }
  }
}
.turning_circle[zoom=16] { marker-width:4; }

/* ---- Zoom level 17 --------------------------------------------- */
#roads_high[zoom=17],
#bridge[zoom=17] {
  [type='service'] {
    ::case { line-width: 3+3; }
    ::fill { line-width: 3; }
  }
  [type='tertiary'], [type='tertiary_link'],
  [type='residential'], [type='living_street'],
  [type='road'], [type='unclassified'], [type='unknown'] {
    ::case { line-width:8+3; }
    ::fill { line-width:8; }
  }
  [type='secondary_link'],
  [type='primary_link'] {
    ::case { line-width: 6+3; }
    ::fill { line-width: 6; }
  }
  [type='trunk_link'],
  [type='motorway_link'] {
    ::case { line-width: 6+3; }
    ::fill { line-width: 6; }
  }
  [type='secondary'] {
    ::case { line-width: 8+3; }
    ::fill { line-width: 8; }
  }
  [type='primary'] {
    ::case { line-width: 9+3; }
    ::fill { line-width: 9; }
  }
  [type='trunk'],
  [type='motorway'] {
    ::case { line-width: 10+3; }
    ::fill { line-width: 10; }
  }
}
.turning_circle[zoom=17] { marker-width:6; }

/* ---- Zoom level 18 --------------------------------------------- */
#roads_high[zoom>=18],
#bridge[zoom>=18] {
  [type='tertiary'], [type='tertiary_link'],
  [type='residential'], [type='living_street'],
  [type='road'], [type='unclassified'], [type='unknown'] {
    ::case { line-width:10+2; }
    ::fill { line-width:10; }
  }
  [type='secondary_link'],
  [type='primary_link'] {
    ::case { line-width: 14+3; }
    ::fill { line-width: 14; }
  }
  [type='trunk_link'],
  [type='motorway_link'] {
    ::case { line-width: 14+3; }
    ::fill { line-width: 14; }
  }
  [type='secondary'] {
    ::case { line-width: 16+3; }
    ::fill { line-width: 16; }
  }
  [type='primary'] {
    ::case { line-width: 18+3; }
    ::fill { line-width: 18; }
  }
  [type='trunk'],
  [type='motorway'] {
    ::case { line-width: 20+3; }
    ::fill { line-width: 20; }
  }
}
.turning_circle[zoom>=18] { marker-width:5; }

/* == 3. ROAD LABELS ============================================== */

#motorway_label[type='motorway'][zoom>9],
#motorway_label[type='trunk'][zoom>9] {
  text-name:'[ref]';
  text-face-name:@sans_bold;
  text-placement:line;
  text-fill:#777;
  text-halo-fill:#fff;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:10;
  [zoom=11] { text-min-distance:70; }
  [zoom=12] { text-min-distance:80; }
  [zoom=13] { text-min-distance:100; }
}

#mainroad_label[type='primary'][zoom>12],
#mainroad_label[type='secondary'][zoom>13],
#mainroad_label[type='tertiary'][zoom>13] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-fill:#555;
  text-halo-fill:#fff;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:11;
}

#minorroad_label[zoom>14] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-size:9;
  text-fill:#444;
  text-halo-fill:#fff;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:11;
}

/* == 4. RAILWAYS ================================================= */

/* TODO: fancier railway styling with casing, thicker lines */
#rail[zoom>7] {
  line-color:@rail_line;
  line-dasharray:3,2;
  line-width:0.5;
  [tunnel=1] { line-opacity:0.5; }
  [zoom>9] { line-width:1; }
}

/* == 5. AEROWAYS ================================================= */

#aeroway[zoom>9] {
  line-color:@aeroway;
  line-cap:butt;
  line-join:miter;
  [type='runway'] {
    [zoom=10]{ line-width:1; }
    [zoom=11]{ line-width:2; }
    [zoom=12]{ line-width:3; }
    [zoom=13]{ line-width:5; }
    [zoom=14]{ line-width:7; }
    [zoom=15]{ line-width:11; }
    [zoom=16]{ line-width:15; }
    [zoom=17]{ line-width:19; }
    [zoom>17]{ line-width:23; }
  }
  [type='taxiway'] {
    [zoom=10]{ line-width:0.2; }
    [zoom=11]{ line-width:0.2; }
    [zoom=12]{ line-width:0.2; }
    [zoom=13]{ line-width:1; }
    [zoom=14]{ line-width:1.5; }
    [zoom=15]{ line-width:2; }
    [zoom=16]{ line-width:3; }
    [zoom=17]{ line-width:4; }
    [zoom>17]{ line-width:5; }
  }
}
