/* "Minorroads", including tracks, bicycle & pedestrian ways.
 *
 * CONTENTS:
 *   1. Road Colors & Line Styles
 *   2. Road Widths
 */

/* == 1. ROAD COLORS & LINE STYLES ================================== */

/* Note that the ordering of certain styles in this section is
   important to the rendered result. ::line should rendered below
   ::case which should be rendered below ::fill.

/* ---- Bridge Setup ------------------------------------------------ */
/* Bridges appear above roads, but complex multi-level layering 
   does not work properly yet. */
#minorbridge::case {
  [zoom>12] {
    line-color:@minorbridge_case;
    line-cap:butt;
    line-join:round;
    line-width:0;
  }
}
#minorbridge::fill { line-width:0; }

/* ---- Colors by road type ----------------------------------------- */
/* Roads - including tunnels */
#minorroads[zoom>=13] {
  ::line, ::case, ::fill {
    line-cap:round;
    line-join:round;
    line-width:0; /* Hides roads that have no further width set */
  }
  [type='path'], [type='track'],
  [type='footway'], [type='pedestrian'] {
    ::line { line-color:@pedestrian_line; }
    ::case { line-color:@pedestrian_case; }
    ::fill { line-color:@pedestrian_fill; }
  }
  [type='cycleway'] {
    ::line { line-color:@cycle_line; }
    ::case { line-color:@cycle_case; }
    ::fill { line-color:@cycle_fill; }
  }
  
}
/* Bridges */
#minorbridge::case[zoom>=13] { line-width:0; }
#minorbridge::fill[zoom>=13] {
  line-cap:round;
  line-join:round;
  [type='cycleway']  {
    line-color:@cycle_fill;
  }
  [type='path'], [type='track'],
  [type='footway'], [type='pedestrian']  {
    line-color:@pedestrian_fill;
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


/* ---- Zoom level 13 --------------------------------------------- */
#minorroads[zoom=13] {
  [type='path'], [type='track'],
  [type='footway'], [type='pedestrian'] {
    ::line { line-width: 1; }
  }
  [type='cycleway'] {
    ::line { line-width: 1; }
  }
}

/* ---- Zoom level 14 --------------------------------------------- */
#minorroads[zoom=14] {
  [type='path'], [type='track'],
  [type='footway'], [type='pedestrian'] {
    ::line { line-width: 1; }
  }
  [type='cycleway'] {
   ::line { line-width: 1; }
  }
}
#turning_circle_case,
#turning_circle_fill { [zoom=14] { marker-width:2; } }

/* ---- Zoom level 15 --------------------------------------------- */
#minorroads[zoom=15] {
  [type='path'], [type='track'],
  [type='footway'], [type='pedestrian'] {
     ::line { line-width: 1; }
  }
  [type='cycleway'] {
    ::line { line-width: 1; }
  }
}
.turning_circle[zoom=15] { marker-width:2.5; }

/* ---- Zoom level 16 --------------------------------------------- */
#minorroads[zoom=16],
#minorbridge[zoom=16] {
  [type='path'], [type='track'],
  [type='footway'], [type='pedestrian'] {
    ::case { line-width:1+2; }
    ::fill { line-width:1; }
  }
  [type='cycleway'] {
    ::case { line-width: 2+2; }
    ::fill { line-width: 2; }
  }
}
.turning_circle[zoom=16] { marker-width:4; }

/* ---- Zoom level 17 --------------------------------------------- */
#minorroads[zoom=17],
#minorbridge[zoom=17] {
  [type='path'], [type='track'],
  [type='footway'], [type='pedestrian'] {
    ::case { line-width:4+2; }
    ::fill { line-width:3; }

  }
  [type='cycleway'] {
    ::case { line-width: 6+2.6; }
    ::fill { line-width: 6; }
  }
}
.turning_circle[zoom=17] { marker-width:6; }

/* ---- Zoom level 18 --------------------------------------------- */
#minorroads[zoom>=18],
#minorbridge[zoom>=18] {
  [type='path'], [type='track'],
  [type='footway'], [type='pedestrian'] {
    ::case { line-width:6+2; }
    ::fill { line-width:5; }
  }
  [type='cycleway'] {
    ::case { line-width: 8+3; }
    ::fill { line-width: 8; }
  }
}
.turning_circle[zoom>=18] { marker-width:5; }
