/******************************************************************************
# Land cover, land use, natural features. Includes both lines and polygons.

Contents:
  1. land
  2. water
  2. landuse
*******************************************************************************/

Map { map-bgcolor: #96C0F0; }

/* ---- land ---------------------------------------------------------------- */

.cliff[zoom>=14] { line-pattern-file: url(./res/pattern-cliff.png); }

.land { polygon-gamma: 0.5; }
.land[zoom<4] { polygon-fill: #fff; }
.land[zoom=4] { polygon-fill: #fdfdfd; }
.land[zoom=5] { polygon-fill: #f9f9f9; }
.land[zoom=6] { polygon-fill: #f5f5f5; }
.land[zoom=7] { polygon-fill: #f1f1f1; }
.land[zoom=8] { polygon-fill: #ececec; }
.land[zoom=9] { polygon-fill: #e8e8e8; }
.land[zoom>9] { polygon-fill: #e4e4e4; }

.grass[size='huge'][zoom>8],
.grass[size='large'][zoom>9],
.grass[size='medium'][zoom>10],
.grass[size='small'][zoom>11]{
  polygon-pattern-file: url(./res/pattern-grass.png);
}
    
.sand[size='huge'][zoom>8],
.sand[size='large'][zoom>9],
.sand[size='medium'][zoom>10],
.sand[size='small'][zoom>11] {
  polygon-fill: #f9f3d3;
}
  .sand[zoom>12] { polygon-pattern-file: url(./res/pattern-sand.png); }
  
.wetland[zoom>10][way_area>10000000],
.wetland[zoom>11][way_area>1000000],
.wetland[zoom>12] {
  polygon-pattern-file: url(./res/pattern-wetland-medium.png);
}

.wood[size='huge'][zoom>8][zoom<12],
.wood[size='large'][zoom>9][zoom<12],
.wood[size='medium'][zoom>10][zoom<12] {
  polygon-fill: #C0DBA5;
}
  .wood[zoom>11][wood!='coniferous'][wood!='deciduous'] {
    polygon-pattern-file: url(./res/pattern-wood.png);
  }
  .wood[wood='coniferous'][size='huge'][zoom>8],
  .wood[wood='coniferous'][size='large'][zoom>9],
  .wood[wood='coniferous'][size='medium'][zoom>10],
  .wood[wood='coniferous'][size='small'][zoom>11] {
    polygon-pattern-file: url(./res/pattern-wood-coniferous.png);
  }
  .wood[wood='deciduous'][size='huge'][zoom>8],
  .wood[wood='deciduous'][size='large'][zoom>9],
  .wood[wood='deciduous'][size='medium'][zoom>10],
  .wood[wood='deciduous'][size='small'][zoom>11] {
    polygon-pattern-file: url(./res/pattern-wood-deciduous.png);
  }
  
/* ---- water --------------------------------------------------------------- */

.water.poly[zoom>=5][way_area>1000000000],
.water.poly[zoom>=6][way_area>100000000],
.water.poly[zoom>=7][way_area>10000000],
.water.poly[zoom>=8][way_area>5000000],
.water.poly[zoom>=9][way_area>1000000],
.water.poly[zoom>=10][way_area>500000],
.water.poly[zoom>=11][way_area>100000],
.water.poly[zoom>=12][way_area>10000],
.water.poly[zoom>=13][way_area>1000],
.water.poly[zoom>=14] { polygon-fill: #96C0F0; }

.water.line[zoom>=15] {
  line-color: #96C0F0;
  line-join: round;
  line-cap: round;
}

.water.line[zoom>=14][zoom<=16][waterway='canal'] { line-width: 7; }
.water.line[zoom>=17][waterway='canal'] { line-width: 11; }

.water.line[zoom>15][waterway='drain'] { line-width: 1; }

.water.line[disused='yes'],
.water.line[lock='yes'],
.water.line[tunnel='yes'] {
  line-color: #fff;
  outline-color: #96C0F0;
  outline-dasharray: 4, 2;
  outline-width: 0.8;
  outline-cap: butt;
}

/* ---- landuse ------------------------------------------------------------- */

.agriculture[zoom>10][way_area>1000000],
.agriculture[zoom>11][way_area>100000],
.agriculture[zoom>12] {
  polygon-fill: #FFBF80;
  polygon-opacity: 0.4;
}

.building[zoom>=14] {
  line-color: #000;
  line-opacity: 0.3;
  line-width: 0.4;
  polygon-fill: #c8beb7;
}

.builtup[zoom>=7][zoom<=10] { polygon-fill: #000; }
.builtup[zoom=7] { polygon-opacity: 0.03; }
.builtup[zoom=8] { polygon-opacity: 0.06; }
.builtup[zoom=9] { polygon-opacity: 0.09; }
.builtup[zoom=10] { polygon-opacity: 0.06; }
.builtop[zoom=11] { polygon-opacity: 0.03; }

.education[zoom>=14] { polygon-fill: #FAF0AC; }

.nature_reserve[size='huge'][zoom>6][zoom<=12],
.nature_reserve[size='large'][zoom>8][zoom<=12],
.nature_reserve[size='medium'][zoom>10][zoom<=12] {
  polygon-pattern-file: url(./res/pattern-nature-reserve.png);
}
.nature_reserve[zoom>12][zoom<=15] {
  polygon-pattern-file: url(./res/pattern-nature-reserve-medium.png);
  }
  .nature_reserve[zoom>15] {
    polygon-pattern-file: url(./res/pattern-nature-reserve-large.png);
  }
  
.park[size='huge'][zoom>8],
.park[size='large'][zoom>9],
.park[size='medium'][zoom>10],
.park[size='small'][zoom>11] {
  polygon-fill: #D9E8C3;
}
  .park[landuse='cemetery'][zoom>11] {
    polygon-pattern-file: url(./res/pattern-cemetery.png);
  }
  .park[landuse='cemetery'][religion='christian'][zoom>11] {
    polygon-pattern-file: url(./res/pattern-cemetery-christian.png);
    }
    .park[landuse='cemetery'][religion='jewish'][zoom>11] {
      /* FIXME */
    }
    .park[landuse='cemetery'][religion='muslim'][zoom>11] {
      /* FIXME */
    }
    
.transportation[zoom>=12] { polygon-fill: #ddd; }