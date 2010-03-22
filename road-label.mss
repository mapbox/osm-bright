/******************************************************************************

Route Labels for OSM Stock
==========================

*******************************************************************************/

.road.label[highway='motorway'][zoom>=11] ref,
.road.label[highway='trunk'][zoom>=12] ref,
.road.label[highway='primary'][zoom>=13] ref {
  shield-face-name: 'Arial Bold';
  shield-fill: #fff;
  shield-size: 9;
  shield-spacing: 500;
  shield-min-distance: 300;
}

/* Different shield-files for differnt label lengths: */
.road.label[highway='motorway'][zoom>=11][length=1] ref,
.road.label[highway='trunk'][zoom>=12][length=1] ref,
.road.label[highway='primary'][zoom>=13][length=1] ref {
  shield-file: url(res/shield-small-1.png);
}
.road.label[highway='motorway'][zoom>=11][length=2] ref,
.road.label[highway='trunk'][zoom>=12][length=2] ref,
.road.label[highway='primary'][zoom>=13][length=2] ref {
  shield-file: url(res/shield-small-2.png);
}
.road.label[highway='motorway'][zoom>=11][length=3] ref,
.road.label[highway='trunk'][zoom>=12][length=4] ref,
.road.label[highway='primary'][zoom>=13][length=4] ref {
  shield-file: url(res/shield-small-3.png);
}
.road.label[highway='motorway'][zoom>=11][length=4] ref,
.road.label[highway='trunk'][zoom>=12][length=4] ref, 
.road.label[highway='primary'][zoom>=13][length=4] ref {
  shield-file: url(res/shield-small-4.png);
}
.road.label[highway='motorway'][zoom>=11][length=5] ref,
.road.label[highway='trunk'][zoom>=12][length=5] ref,
.road.label[highway='primary'][zoom>=13][length=5] ref {
  shield-file: url(res/shield-small-5.png);
}
.road.label[highway='motorway'][zoom>=11][length=6] ref,
.road.label[highway='trunk'][zoom>=12][length=6] ref,
.road.label[highway='primary'][zoom>=12][length=6] ref {
  shield-file: url(res/shield-small-6.png);
}
.road.label[highway='motorway'][zoom>=11][length=7] ref,
.road.label[highway='trunk'][zoom>=12][length=7] ref,
.road.label[highway='primary'][zoom>=12][length=7] ref {
  shield-file: url(res/shield-small-7.png);
}
.road.label[highway='motorway'][zoom>=11][length=8] ref,
.road.label[highway='trunk'][zoom>=12][length=8] ref,
.road.label[highway='primary'][zoom>=12][length=8] ref {
  shield-file: url(res/shield-small-8.png);
}

.road.label[highway='primary'][zoom>=14][ref=''] name,
.road.label[highway='secondary'][zoom>=14] name,
.road.label[highway='tertiary'][zoom>=15] name,
.road.label[highway='unclassified'][zoom>=15] name,
.road.label[highway='road'][zoom>=16] name,
.road.label[highway='residential'][zoom>=16] name,
.road.label[highway='living_street'][zoom>=16] name,
.road.label[highway='service'][zoom>=17] name,
.road.label[highway='unclassified'][zoom>=17] name {
  text-allow-overlap: false;
  text-face-name: 'Arial Regular';
  text-fill: #999;
  text-halo-fill: #fff;
  text-halo-radius: 1;
  text-min-distance: 20;
  text-placement: line;
  text-size: 9;
}

.road.label[highway='primary'][ref=''][zoom>=16] name,
.road.label[highway='secondary'][zoom>=16] name,
.road.label[highway='tertiary'][zoom>=17] name,
.road.label[highway='unclassified'][zoom>=17] name,
.road.label[highway='road'][zoom=18] name,
.road.label[highway='residential'][zoom=18] name,
.road.label[highway='living_street'][zoom=18] name { text-size: 10; }
