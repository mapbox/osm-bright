/* LABELS.MSS CONTENTS:
 * - place names
 * - area labels
 * - waterway labels 
 */

/* Font sets are defined in palette.mss */

/* ================================================================== */
/* PLACE NAMES
/* ================================================================== */

#place_country[zoom>3][zoom<9] {
  text-name:'[name]';
  text-face-name:@sans_bold;
  text-placement:point;
  text-fill:@country_text;
  text-halo-fill: @country_halo;
  text-halo-radius: 1;
  [zoom=3] {
    text-size:10 + @text_adjust;
    text-wrap-width: 40;
  }
  [zoom=4] {
    text-size:11 + @text_adjust;
    text-wrap-width: 50;
  }
  [zoom>4] {
    text-halo-radius: 2;
  }
  [zoom=5] {
    text-size:11 + @text_adjust;
    text-wrap-width: 50;
    text-line-spacing: 1;
  }
  [zoom=6] {
    text-size:12 + @text_adjust;
    text-character-spacing: 1;
    text-wrap-width: 80;
    text-line-spacing: 2;
  }
  [zoom>=7] {
    text-size:14 + @text_adjust;
    text-character-spacing: 2;
  }
}

#place_state[zoom>=5][zoom<=10] {
  text-name:'[name]';
  text-face-name:@sans_bold_italic;
  text-placement:point;
  text-fill:@state_text;
  text-halo-fill: @state_halo;
  text-halo-radius: 1;
  [zoom=6] {
    text-size:10 + @text_adjust;
    text-wrap-width: 40;
  }
  [zoom=7] {
    text-size:11 + @text_adjust;
    text-wrap-width: 50;
  }
  [zoom>8] {
    text-halo-radius: 2;
  }
  [zoom=8] {
    text-size:11 + @text_adjust;
    text-wrap-width: 50;
    text-line-spacing: 1;
  }
  [zoom=9] {
    text-size:12 + @text_adjust;
    text-character-spacing: 1;
    text-wrap-width: 80;
    text-line-spacing: 2;
  }
  [zoom=10] {
    text-size:14 + @text_adjust;
    text-character-spacing: 2;
  }
}

/* ---- Cities ------------------------------------------------------ */

#place_city[zoom>=8][zoom<=15] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@city_text;
  text-halo-fill:@city_halo;
  text-halo-radius:2;
  [zoom<=8] {
    text-size: 10;
    text-halo-radius:1;
  }
  [zoom=9] {
    text-size:10;
    text-wrap-width: 60;
  }
  [zoom=10] {
    text-size:11;
    text-wrap-width: 70;
  }
  [zoom=11] {
    text-size:12;
    text-character-spacing: 1;
    text-wrap-width: 80;
  }
  [zoom=12] {
    text-size:13;
    text-character-spacing: 1;
    text-wrap-width: 100;
  }
  [zoom=13] {
    text-size:14;
    text-character-spacing: 2;
    text-wrap-width: 200;
    text-transform: uppercase;
  }
  [zoom=14] {
    text-size:15;
    text-character-spacing: 4;
    text-wrap-width: 300;
    text-transform: uppercase;
  }
  [zoom=15] {
    text-size:16;
    text-character-spacing: 6;
    text-wrap-width: 400;
    text-transform: uppercase;
  }
}

/* ---- Towns ------------------------------------------------------- */

#place_town[zoom>=9][zoom<=16] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@town_text;
  text-size:9;
  text-halo-fill:@town_halo;
  text-halo-radius:1;
  text-wrap-width: 50;
  [zoom>=10] {
    text-halo-radius:2;
    text-size: 10;
  }
  [zoom>=11]{ text-size:11; }
  [zoom>=12]{
    text-size:12;
    text-line-spacing: 1;
  }
  [zoom>=13]{
    text-transform: uppercase;
    text-character-spacing: 1;
    text-line-spacing: 2;
  }
  [zoom>=14]{
    text-size:13;
    text-character-spacing: 2;
    text-line-spacing: 3;
  }
  // [zoom>=15]{
  //   text-size:14;
  //   text-character-spacing: 3;
  //   text-line-spacing: 4;
  // }
  [zoom>=15]{
    text-size:15;
    text-character-spacing: 4;
    text-line-spacing: 5;
  }
  // [zoom>=17]{
  //   text-size:16;
  //   text-character-spacing: 5;
  //   text-line-spacing: 6;
  // }
}

/* ---- Other small places ------------------------------------------ */

#place_small[zoom>=13][zoom<=16] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@other_text;
  text-size:10;
  text-halo-fill:@other_halo;
  text-halo-radius:1;
  text-wrap-width: 30;
  [zoom>=14] {
    text-size:11;
    text-character-spacing: 1;
    text-wrap-width: 40;
    text-line-spacing: 1;
  }
  [zoom>=15] {
    text-halo-radius: 2;
    text-transform: uppercase;
    text-character-spacing: 1;
    text-wrap-width: 60; 
    text-line-spacing: 1;
  }
  [zoom>=16] {
    text-size:12;
    text-character-spacing: 2;
    text-wrap-width: 120;
    text-line-spacing: 2;
  } 
  // [zoom>=17] {
  //   text-size:13; 
  //   text-character-spacing: 3;
  //   text-wrap-width: 160;
  //   text-line-spacing: 4;
  // }
  // [zoom>=18] {
  //   text-size:14;
  //   text-character-spacing: 4;
  //   text-line-spacing: 6;
  // }
}

#place_tiny[zoom>=15][zoom<=17] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@locality_text;
  text-size:9;
  text-halo-fill:@locality_halo;
  text-halo-radius:1;
  text-wrap-width: 30;
  [zoom>=16] {
    text-size:10;
    text-wrap-width: 60;
    text-line-spacing: 1;
  }
  [zoom>=17] {
    text-size:11;
    text-wrap-width: 120;
    text-line-spacing: 2;
  }
  [zoom>=18] {
    text-size:12;
    text-character-spacing: 1;
    text-line-spacing: 4;
  }
}


// =====================================================================
// AREA LABELS
// =====================================================================

#area_label {
  // Bring in labels gradually as one zooms in, bases on polygon area
  [zoom>=10][area>102400000/111000.0/111000.0],
  [zoom>=11][area>25600000/111000.0/111000.0],
  [zoom>=13][area>1600000/111000.0/111000.0],
  [zoom>=14][area>320000/111000.0/111000.0],
  [zoom>=15][area>80000/111000.0/111000.0],
  [zoom>=16][area>20000/111000.0/111000.0],
  [zoom>=17][area>5000/111000.0/111000.0],
  [zoom>=18][area>=0] {
    text-name: "[name]";
    text-halo-radius: 1.5;
    text-face-name:@sans;
    text-size: 11;
    text-wrap-width:30;
    text-fill: @area_text;
    text-halo-fill: @area_halo;
    // Specific style overrides for different types of areas:
    [type='park'][zoom>=10] {
      text-face-name: @sans_lt_italic;
      text-fill: @park * 0.6;
      text-halo-fill: lighten(@park, 10%);
    }
    [type='golf_course'][zoom>=10] {
      text-fill: @sports * 0.6;
      text-halo-fill: lighten(@sports, 10%);
    }
    [type='cemetery'][zoom>=10] {
      text-fill: @cemetery * 0.6;
      text-halo-fill: lighten(@cemetery, 10%);
    }
    [type='school'][zoom>=10] {
      text-fill: @school * 0.6;
      text-halo-fill: lighten(@school, 10%);
    }
    [type='water'][zoom>=10] {
        text-fill: @water * 0.75;
        text-halo-fill: fadeout(lighten(@water,5%),25%);
        text-halo-radius: 1;
        text-face-name: @sans_italic;
    }
  }
  [zoom=15][area>1600000/111000.0/111000.0],
  [zoom=16][area>80000/111000.0/111000.0],
  [zoom=17][area>20000/111000.0/111000.0],
  [zoom=18][area>5000/111000.0/111000.0] {
    text-name: "[name]";
    text-size: 13;
    text-wrap-width: 60;
    text-character-spacing: 1;
    text-halo-radius: 2;
  }
  [zoom=16][area>1600000/111000.0/111000.0],
  [zoom=17][area>80000/111000.0/111000.0],
  [zoom=18][area>20000/111000.0/111000.0] {
    text-size: 15;
    text-character-spacing: 2;
    text-wrap-width: 120;
  }
  [zoom>=17][area>1600000/111000.0/111000.0],
  [zoom>=18][area>80000/111000.0/111000.0] {
    text-size: 20;
    text-character-spacing: 3;
    text-wrap-width: 180;
  }
}

#building_label[zoom>=18] {
  text-name:"[bname]";
  text-face-name:@sans_italic;
  text-size:8;
  text-wrap-width:30;
  text-fill: @poi_text;
}
   

/* ================================================================== */
/* WATERWAY LABELS
/* ================================================================== */

#waterway_label[type='river'][zoom>=13],
#waterway_label[type='canal'][zoom>=15],
#waterway_label[type='stream'][zoom>=17] {
  text-name: '[name]';
  text-face-name: @sans_italic;
  text-fill: @water * 0.75;
  text-halo-fill: fadeout(lighten(@water,5%),25%);
  text-halo-radius: 1;
  text-placement: line;
  text-min-distance: 400;
  text-size: 10;
  [type='river'][zoom=15],
  [type='canal'][zoom=17] {
    text-size: 11;
  }
  [type='river'][zoom>=16],
  [type='canal'][zoom=18] {
    text-size: 14;
    text-spacing: 300;
  }
}

/* ================================================================== */
/* ROAD LABELS
/* ================================================================== */

// #road_label::shield-pt[class='motorway'][zoom>=7][zoom<=10][localrank=1][reflen<=6],
// #road_label::shield-pt[class='motorway'][zoom>=9][zoom<=10][localrank=1][reflen<=6],
// #road_label::shield-ln[zoom>=11][reflen<=6] {
//   shield-name: "[ref].replace('·', '\n')";
//   shield-size: 9;
//   shield-line-spacing: -4;
//   shield-file: url('shield/[shield]-[reflen].svg');
//   shield-face-name: @sans;
//   shield-fill: #333;
//   [zoom>=14] {
//     shield-transform: scale(1.25,1.25);
//     shield-size: 11;
//   }
// }
// #road_label::shield-pt[class='motorway'][zoom>=7][zoom<=10][localrank=1][reflen>0][reflen<=6],
// #road_label::shield-pt[class='motorway'][zoom>=9][zoom<=10][localrank=1][reflen>0][reflen<=6] {
//   shield-placement: point;
//   shield-avoid-edges: false;
// }
// #road_label::shield-ln[zoom>=11][reflen>0][reflen<=6] {
//   shield-placement: line;
//   shield-spacing: 400;
//   shield-min-distance: 100;
//   shield-avoid-edges: true;
// }

#motorway_label_low[zoom>=5][zoom<=8][reflen>0][reflen<=8],
#motorway_label_med[zoom>=9][zoom<=11][reflen>0][reflen<=8],
#motorway_label_gen2[zoom>=12][zoom<=13][reflen>0][reflen<=8],
#motorway_label[zoom>=12][zoom<=15][reflen>0][reflen<=8] {
  shield-name: "[ref].replace('·', '\n')";
  shield-size: 9;
  shield-line-spacing: -4;
  shield-file: url('shield/default-[reflen].svg');
  shield-face-name: @sans;
  shield-fill: @motorway_shield_fill;
  [zoom>=14] {
    shield-transform: scale(1.25,1.25);
    shield-size: 11;
  }
  [zoom<=11] { shield-min-distance: 60; } //50
  [zoom=12] { shield-min-distance: 80; } //60
  [zoom=13] { shield-min-distance: 120; } //120
  [zoom>=14] { shield-min-distance: 180; }
}

// low not needed since labels start from z10
#motorway_label_med[zoom>9][zoom<=11][type='motorway'],
#motorway_label_med[zoom>9][zoom<=11][type='trunk'],
#motorway_label_gen2[zoom>=12][zoom<=13][type='motorway'],
#motorway_label_gen2[zoom>=12][zoom<=13][type='trunk'],
#motorway_label[type='motorway'][zoom>=14],
#motorway_label[type='trunk'][zoom>=14] {
  text-name:"[name]";
  text-face-name:@sans_bold;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:10;
  [zoom=11] { text-min-distance:70; }
  [zoom=12] { text-min-distance:80; }
  [zoom=13] { text-min-distance:100; }
}

#mainroad_label_gen2[zoom=13][type='primary'],
#mainroad_label[type='primary'][zoom>=14],
#mainroad_label[type='secondary'][zoom>=14],
#mainroad_label[type='tertiary'][zoom>=14] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:11;
}

#minorroad_label[zoom>14] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-size:9;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:11;
}

/* ================================================================== */
/* ONE-WAY ARROWS
/* ================================================================== */
#motorway_label[zoom>=16],
#mainroad_label[zoom>=16],
#minorroad_label[zoom>=16] {
  [oneway = 'yes'],
  [oneway='-1'] {
     marker-placement:line;
     marker-max-error: 0.5;
     marker-spacing: 200;
     marker-file: url(img/icon/oneway.svg);
     [oneway='-1'] { marker-file: url(img/icon/oneway-reverse.svg); }
     [zoom=16] { marker-transform: "scale(0.5)"; }
     [zoom=17] { marker-transform: "scale(0.75)"; }
  }
}

/* ****************************************************************** */
