/*******************************************************************************
# Roads

## Contents:
  1. one-way arrows
  2. line styles
  3. line colors
  4. line-widths by zoom level
  5. outlines
  6. tunnels
  7. bridges
*******************************************************************************/

/* ---- one-way arrows ------------------------------------------------------ */

.road.fill[zoom>15][oneway='1'],
.road.fill[zoom>15][oneway='true'],
.road.fill[zoom>15][oneway='yes'] {
  line-pattern-file: url(./res/pattern-oneway.png);
}

/* ---- line styles --------------------------------------------------------- */

.road {
  line-cap: round;
  line-join: miter;
}
  .road.outline {
    outline-cap: round;
    outline-join: miter;
  }
  .road.fill {
    outline-cap: butt;
    outline-join: miter;
  }
  .road[highway='service'] {
    line-cap: butt;
    outline-cap: butt;
  }

/* ---- line colors --------------------------------------------------------- */

.road-lowzoom,
.road.fill[highway='motorway'],
.road.fill[highway='motorway_link'],
.road.fill[highway='trunk'],
.road.fill[highway='trunk_link'],
.road.fill[highway='primary'],
.road.fill[highway='primary_link'],
.road.fill[highway='secondary'],
.road.fill[highway='secondary_link'],
.road.fill[highway='tertiary'],
.road.fill[highway='unclassified'],
.road.fill[highway='road'],
.road.fill[highway='residential'] { line-color: #fff; }

.road.fill[highway='service'] { line-color: #f6f6f6; }

.road.fill[highway='track']  {
  line-color: #bbb;
  line-dasharray: 4, 3;
  outline-color: #fff;
  outline-width: 0.5;
}

/* ---- line widths by zoom level ------------------------------------------- */

.road-lowzoom[zoom=8][highway='motorway']        { line-width: 0.8; }
.road-lowzoom[zoom=8][highway='trunk']           { line-width: 0.8; }

.road-lowzoom[zoom=9][highway='motorway']        { line-width: 1; }
.road-lowzoom[zoom=9][highway='trunk']           { line-width: 1; }

.road[zoom=10][highway='motorway']       { line-width: 1.5; }
.road[zoom=10][highway='trunk']          { line-width: 1.5; }
.road[zoom=11][highway='primary']        { line-width: 0.8; }

.road[zoom=11][highway='motorway']       { line-width: 2; }
.road[zoom=11][highway='motorway_link']  { line-width: 1; }
.road[zoom=11][highway='trunk']          { line-width: 2; }
.road[zoom=11][highway='trunk_link']     { line-width: 0.8; }
.road[zoom=11][highway='primary']        { line-width: 1; }
.road[zoom=11][highway='secondary']      { line-width: 0.8; }

.road[zoom=12][highway='motorway']       { line-width: 2; }
.road[zoom=12][highway='motorway_link']  { line-width: 0.5; }
.road[zoom=12][highway='trunk']          { line-width: 2; }
.road[zoom=12][highway='trunk_link']     { line-width: 0.5; }
.road[zoom=12][highway='primary']        { line-width: 1.5; }
.road[zoom=12][highway='primary_link']   { line-width: 0.5; }
.road[zoom=12][highway='secondary']      { line-width: 1; }
.road[zoom=12][highway='secondary_link'] { line-width: 0.5; }
.road[zoom=12][highway='tertiary']       { line-width: 1; }

.road[zoom=13][highway='motorway']       { line-width: 4; }
.road[zoom=13][highway='motorway_link']  { line-width: 3; }
.road[zoom=13][highway='trunk']          { line-width: 4; }
.road[zoom=13][highway='trunk_link']     { line-width: 1.2; }
.road[zoom=13][highway='primary']        { line-width: 1.2; }
.road[zoom=13][highway='primary_link']   { line-width: 0.8; }
.road[zoom=13][highway='secondary']      { line-width: 1.2; }
.road[zoom=13][highway='secondary_link'] { line-width: 0.8; }
.road[zoom=13][highway='tertiary']       { line-width: 1.5; }
.road[zoom=13][highway='unclassified']   { line-width: 1.2; }
.road[zoom=13][highway='road']           { line-width: 0.8; }
.road[zoom=13][highway='residential']    { line-width: 0.8; }

.road[zoom=14][highway='motorway']       { line-width: 6; }
.road[zoom=14][highway='motorway_link']  { line-width: 4; }
.road[zoom=14][highway='trunk']          { line-width: 6; }
.road[zoom=14][highway='trunk_link']     { line-width: 2; }
.road[zoom=14][highway='primary']        { line-width: 3; }
.road[zoom=14][highway='primary_link']   { line-width: 1.5; }
.road[zoom=14][highway='secondary']      { line-width: 3; }
.road[zoom=14][highway='secondary_link'] { line-width: 1.5; }
.road[zoom=14][highway='tertiary']       { line-width: 2; }
.road[zoom=14][highway='unclassified']   { line-width: 1.8; }
.road[zoom=14][highway='road']           { line-width: 1.5; }
.road[zoom=14][highway='residential']    { line-width: 1.5; }
.road[zoom=14][highway='service']        { line-width: 1; }
.road[zoom=14][highway='track']          { line-width: 0.6; }

.road[zoom=15][highway='motorway']       { line-width: 8; }
.road[zoom=15][highway='motorway_link']  { line-width: 5; }
.road[zoom=15][highway='trunk']          { line-width: 8; }
.road[zoom=15][highway='trunk_link']     { line-width: 4; }
.road[zoom=15][highway='primary']        { line-width: 4; }
.road[zoom=15][highway='primary_link']   { line-width: 2; }
.road[zoom=15][highway='secondary']      { line-width: 4; }
.road[zoom=15][highway='secondary_link'] { line-width: 2; }
.road[zoom=15][highway='tertiary']       { line-width: 3; }
.road[zoom=15][highway='unclassified']   { line-width: 2.5; }
.road[zoom=15][highway='road']           { line-width: 2; }
.road[zoom=15][highway='residential']    { line-width: 2; }
.road[zoom=15][highway='service']        { line-width: 2; }
.road[zoom=15][highway='track']          { line-width: 1.2; }

.road[zoom=16][highway='motorway']       { line-width: 10; }
.road[zoom=16][highway='motorway_link']  { line-width: 6; }
.road[zoom=16][highway='trunk']          { line-width: 10; }
.road[zoom=16][highway='trunk_link']     { line-width: 6; }
.road[zoom=16][highway='primary']        { line-width: 8; }
.road[zoom=16][highway='primary_link']   { line-width: 6; }
.road[zoom=16][highway='secondary']      { line-width: 8; }
.road[zoom=16][highway='secondary_link'] { line-width: 6; }
.road[zoom=16][highway='tertiary']       { line-width: 6; }
.road[zoom=16][highway='unclassified']   { line-width: 6; }
.road[zoom=16][highway='road']           { line-width: 5; }
.road[zoom=16][highway='residential']    { line-width: 5; }
.road[zoom=16][highway='service']        { line-width: 3; }
.road[zoom=16][highway='track']          { line-width: 1.6; }

.road[zoom=17][highway='motorway']       { line-width: 14; }
.road[zoom=17][highway='motorway_link']  { line-width: 8; }
.road[zoom=17][highway='trunk']          { line-width: 14; }
.road[zoom=17][highway='trunk_link']     { line-width: 6; }
.road[zoom=17][highway='primary']        { line-width: 13; }
.road[zoom=17][highway='primary_link']   { line-width: 6; }
.road[zoom=17][highway='secondary']      { line-width: 13; }
.road[zoom=17][highway='secondary_link'] { line-width: 6; }
.road[zoom=17][highway='tertiary']       { line-width: 10; }
.road[zoom=17][highway='unclassified']   { line-width: 10; }
.road[zoom=17][highway='road']           { line-width: 8; }
.road[zoom=17][highway='residential']    { line-width: 8; }
.road[zoom=17][highway='service']        { line-width: 4; }
.road[zoom=17][highway='track']          { line-width: 2; }

.road[zoom=18][highway='motorway']       { line-width: 16; }
.road[zoom=18][highway='motorway_link']  { line-width: 10; }
.road[zoom=18][highway='trunk']          { line-width: 16; }
.road[zoom=18][highway='trunk_link']     { line-width: 8; }
.road[zoom=18][highway='primary']        { line-width: 15; }
.road[zoom=18][highway='primary_link']   { line-width: 8; }
.road[zoom=18][highway='secondary']      { line-width: 15; }
.road[zoom=18][highway='secondary_link'] { line-width: 8; }
.road[zoom=18][highway='tertiary']       { line-width: 12; }
.road[zoom=18][highway='unclassified']   { line-width: 12; }
.road[zoom=18][highway='road']           { line-width: 10; }
.road[zoom=18][highway='residential']    { line-width: 10; }
.road[zoom=18][highway='service']        { line-width: 5; }
.road[zoom=18][highway='track']          { line-width: 2.5; }

/* ---- Outlines ------------------------------------------------------------ */

.road.outline {
  /* this seems necessary to make outlines appear */
  line-color: #000;
  line-opacity: 0;
}

/*.road.outline[zoom>=14][highway='motorway'],
.road.outline[zoom>=14][highway='motorway_link'],
.road.outline[zoom>=14][highway='trunk'],
.road.outline[zoom>=14][highway='trunk_link'],
.road.outline[zoom>=14][highway='primary'],
.road.outline[zoom>=14][highway='primary_link'],
.road.outline[zoom>=14][highway='secondary'],
.road.outline[zoom>=14][highway='secondary_link'],
.road.outline[zoom>=14][highway='tertiary'],
.road.outline[zoom>=14][highway='unclassified'],
.road.outline[zoom>=14][highway='road'],
.road.outline[zoom>=14][highway='residential'],
.road.outline[zoom>=14][highway='service'],
.road.outline[zoom>=14][highway='track'] {
  outline-color: #888;
  outline-width: 0.8;
}*/

/* ---- Tunnels ------------------------------------------------------------- */

.road.fill[tunnel='yes'][zoom>12] { line-color: #f3f3f3; }
.road.outline[tunnel='yes'][zoom>12] {
  outline-cap: butt;
  outline-color: #888;
}
  .road.outline[tunnel='yes'][zoom=13] {
    outline-dasharray: 2, 2;
    outline-width: 0.5;
  }
  .road.outline[tunnel='yes'][zoom=14] {
    outline-dasharray: 3, 2;
    outline-width: 0.7;
  }
  .road.outline[tunnel='yes'][zoom=15] {
    outline-dasharray: 4, 3;
    outline-width: 0.9;
  }
  .road.outline[tunnel='yes'][zoom=16] {
    outline-dasharray: 4, 3;
    outline-width: 1;
  }
  .road.outline[tunnel='yes'][zoom=17] {
    outline-dasharray: 5, 4;
    outline-width: 1.1;
  }
  .road.outline[tunnel='yes'][zoom=18] {
    outline-dasharray: 5, 4;
    outline-width: 1.2;
  }
  
/* ---- Bridges ------------------------------------------------------------- */

.road.bridge[zoom>13],
.road.bridge[zoom>13][layer=1],
.road.bridge[zoom>13][layer=2],
.road.bridge[zoom>13][layer=3],
.road.bridge[zoom>13][layer=4],
.road.bridge[zoom>13][layer=5] {
  line-color: #fff;
  line-opacity: 1;
  outline-color: #bbb;
  outline-width: 1;
}