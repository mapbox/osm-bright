/* borders, placenames, and POIs */

/* ==== PLACES ==================================================== */

#place::country[type='country'][zoom>3][zoom<9] {
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
  [zoom=7] {
    text-size:14 + @text_adjust;
    text-character-spacing: 2;
  }
}

#place::state[type='state'][zoom>=5][zoom<=10] {
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

#place::city[type='city'][zoom>=8][zoom<=15] {
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

#place::town[type='town'][zoom>=9][zoom<=17] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:#666;
  text-size:9;
  text-halo-fill:#fff;
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
  [zoom>=15]{
    text-size:14;
    text-character-spacing: 3;
    text-line-spacing: 4;
  }
  [zoom>=15]{
    text-size:15;
    text-character-spacing: 4;
    text-line-spacing: 5;
  }
  [zoom>=17]{
    text-size:16;
    text-character-spacing: 5;
    text-line-spacing: 6;
  }
}

/* ---- Other small places ------------------------------------------ */

#place::small[type='village'][zoom>=13],
#place::small[type='suburb'][zoom>=13],
#place::small[type='hamlet'][zoom>=13] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:#888;
  text-size:10;
  text-halo-fill:#fff;
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
  [zoom>=17] {
    text-size:13;
    text-character-spacing: 3;
    text-wrap-width: 160;
    text-line-spacing: 4;
  }
  [zoom>=18] {
    text-size:14;
    text-character-spacing: 4;
    text-line-spacing: 6;
  }
}

#place::small[type='locality'][zoom>=15] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:#aaa;
  text-size:9;
  text-halo-fill:@land;
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


/* ==== AREA LABELS ================================================ */

#landuse_label[zoom>12][area>1000000] {
  [type='industrial'],[type='commercial'],[type='parking'],
  [type='park'],[type='golf_course'] {
    text-name:'[name]';
    text-face-name:@sans;
    text-fill:#000;
    text-halo-fill:fadeout(#fff,20);
    text-halo-radius:2;
    text-placement:interior;
    text-size:11;
    text-wrap-width:20;
  }
  [type='cemetery'] {
    text-fill:darken(@cemetery,50);
  }
  [type='park'], [type='golf_course'] {
    text-fill:darken(@park,50);
  }
  [type='school'], [type='college'], [type='university'] {
    text-fill:darken(@school,50);
  }
}
#landuse_label[zoom>12][area>1000000],
#landuse_label[zoom>13][area>500000],
#landuse_label[zoom>14][area>250000],
#landuse_label[zoom>15][area>125000],
#landuse_label[zoom>16][area>612500],
#landuse_label[zoom>17] {
  text-name:'[name]';
  text-face-name:@sans;
  text-fill:#000;
  [type='pedestrian'] { text-fill:#333; }
  text-halo-fill:#fff;
  text-halo-radius:2;
  text-placement:interior;
  text-size:11;
  text-wrap-width:20;
  [zoom>14] { text-size:12; }
  [type='cemetery'] {
    text-fill:darken(@cemetery,50);
  }
  [type='park'], [type='golf_course'] {
    text-fill:darken(@park,50);
  }
  [type='school'], [type='college'], [type='university'] {
    text-fill:darken(@school,50);
  }
}

.amenity[zoom>=15][amenity='hospital'] {
  text-allow-overlap: false;
  text-face-name: 'Arial Regular';
  text-fill: #999;
  text-name: '[name]';
  text-halo-fill: #fff;
  text-halo-radius: 1;
  text-min-distance: 20;
  text-placement: line;
}

/* Education */
.amenity[zoom>=15][amenity='college'] { point-file: url(./res/school-college-10.png); }
.amenity[zoom>=15][amenity='kindergarten'] { point-file: url(./res/school-elementary-10.png); }
.amenity[zoom>=15][amenity='library'] { point-file: url(./res/library-10.png); }
.amenity[zoom>=15][amenity='school'] { point-file: url(./res/school-elementary-10.png); }
.amenity[zoom>=15][amenity='university'] { point-file: url(./res/school-college-10.png); }

/* Health */
.amenity[zoom>=16][amenity='baby_hatch'] {  }
.amenity[zoom>=16][amenity='dentist'] {  }
.amenity[zoom>=16][amenity='doctors'] {  }
.amenity[zoom>=15][amenity='hospital'] { point-file: url(./res/medical-10.png); }
.amenity[zoom>=16][amenity='hospital'] { point-file: url(./res/medical-15.png); }
.amenity[zoom>=16][amenity='pharmacy'] {  }
.amenity[zoom>=16][amenity='veterinary'] {  }

/* Transportation */
.amenity[zoom>=15][amenity='bicycle_parking'] {  }
.amenity[zoom>=15][amenity='bicycle_rental'] {  }
.amenity[zoom>=15][amenity='bus_station'] { point-file: url(./res/bus-10.png); }
.amenity[zoom>=15][amenity='car_rental'] {  }
.amenity[zoom>=15][amenity='car_sharing'] {  }
.amenity[zoom>=15][amenity='car_wash'] {  }
.amenity[zoom>=15][amenity='ferry_terminal'] { point-file: url(./res/port-10.png); }
.amenity[zoom>=15][amenity='fuel'] { point-file: url(./res/fuel-10.png); }
.amenity[zoom>=15][amenity='grit_bin'] {  }
.amenity[zoom>=15][amenity='taxi'] {  }

/* Financial */
.amenity[zoom>=16][amenity='atm'] {  }
.amenity[zoom>=16][amenity='bank'] {  }
.amenity[zoom>=16][amenity='bureau_de_change'] {  }

/* Food/Drink */
.amenity[zoom>=16][amenity='bar'] { point-file: url(./res/restaurant-10.png);  }
.amenity[zoom>=16][amenity='cafe'] { point-file: url(./res/cafe-10.png); }
.amenity[zoom>=16][amenity='fast_food'] { point-file: url(./res/restaurant-10.png);  }
.amenity[zoom>=16][amenity='food_court'] { point-file: url(./res/restaurant-10.png);  }
.amenity[zoom>=16][amenity='pub'] { point-file: url(./res/restaurant-10.png);  }
.amenity[zoom>=16][amenity='restaurant'] { point-file: url(./res/restaurant-10.png); }

/* Entertainment, Arts, Culture */
.amenity[zoom>=16][amenity='architect_office'] {  }
.amenity[zoom>=16][amenity='arts_centre'] {  }
.amenity[zoom>=16][amenity='cinema'] { point-file: url(./res/cinema-10.png); }
.amenity[zoom>=16][amenity='community_centre'] {  }
.amenity[zoom>=16][amenity='fountain'] {  }
.amenity[zoom>=16][amenity='nightclub'] {  }
.amenity[zoom>=16][amenity='stripclub'] {  }
.amenity[zoom>=16][amenity='studio'] {  }
.amenity[zoom>=16][amenity='theatre'] {  }

/* Public */
.amenity[zoom>=16][amenity='courthouse'] {  }
.amenity[zoom>=16][amenity='fire_station'] {  }
.amenity[zoom>=16][amenity='grave_yard'] {  }
.amenity[zoom>=16][amenity='place_of_worship'] {  }
.amenity[zoom>=16][amenity='police'] {  }
.amenity[zoom>=16][amenity='post_office'] { point-file: url(./res/post-10.png); }
.amenity[zoom>=16][amenity='prison'] {  }
.amenity[zoom>=16][amenity='public_building'] {  }
.amenity[zoom>=16][amenity='shelter'] {  }
.amenity[zoom>=16][amenity='townhall'] { point-file: url(./res/town-hall-10.png); }

/* Public - small */
.amenity[zoom>=17][amenity='bench'] {  }
.amenity[zoom>=17][amenity='post_box'] {  }
.amenity[zoom>=17][amenity='recycling'] {  }
.amenity[zoom>=17][amenity='telephone'] {  }
.amenity[zoom>=17][amenity='toilets'] {  }
.amenity[zoom>=17][amenity='vending_machine'] {  }
.amenity[zoom>=17][amenity='waste_basket'] {  }
.amenity[zoom>=17][amenity='waste_disposal'] {  }
