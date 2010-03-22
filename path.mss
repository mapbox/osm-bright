/*******************************************************************************
# Paths - primarily/exclusively not for motorvehicles
*******************************************************************************/

/* Pedestrian & Footway are (almost) the exact same thing? */
/* Trail is not documented but sometimes used. Probably equivalent to path. */
.path.fill[highway='footway'][zoom>14],
.path.fill[highway='path'][zoom>14],
.path.fill[highway='pedestrian'][zoom>14],
.path.fill[highway='trail'][zoom>14] {
  line-color: #f8f8f8;
  inline-color: #ddd;
}
.path[highway='footway'][zoom=15],
.path[highway='path'][zoom=15],
.path[highway='pedestrian'][zoom=15],
.path[highway='trail'][zoom=15] {
  inline-width: 0.8;
  inline-dasharray: 2, 2;
  line-width: 1.8;
  }
  .path[highway='footway'][zoom=16],
  .path[highway='path'][zoom=16],
  .path[highway='pedestrian'][zoom=16],
  .path[highway='trail'][zoom=16] {
    inline-width: 1;
    inline-dasharray: 2, 2;
    line-width: 2;
  }
  .path[highway='footway'][zoom=17],
  .path[highway='path'][zoom=17],
  .path[highway='pedestrian'][zoom=17],
  .path[highway='trail'][zoom=17] {
    inline-width: 1.5;
    inline-dasharray: 2, 2;
    line-width: 3;
  }
  .path[highway='footway'][zoom=18],
  .path[highway='path'][zoom=18],
  .path[highway='pedestrian'][zoom=18],
  .path[highway='trail'][zoom=18] {
    inline-width: 2;
    inline-dasharray: 2, 2;
    line-width: 4;
  }

/* Steps */
.path.fill[highway='steps'][zoom>14] {
  line-color: #f6f6f6;
  line-cap: butt;
  outline-cap: butt;
  outline-color: #aaa;
  outline-width: 0.5;
}
  .path[highway='steps'][zoom=15] {
    line-width: 2;
    line-dasharray: 1, 1;
  }
  .path[highway='steps'][zoom=16] {
    line-width: 2.5;
    line-dasharray: 1, 1;
  }
  .path[highway='steps'][zoom=17] {
    line-width: 3;
    line-dasharray: 2, 1;
  }
  .path[highway='steps'][zoom=18] {
    line-width: 4;
    line-dasharray: 2, 1;
  }