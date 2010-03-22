/*******************************************************************************
# Place Labels
*******************************************************************************/

.place name {
  text-allow-overlap: false;
  text-face-name: "Arial Regular";
}

/* ---- big ----------------------------------------------------------------- */

.place[place='country'][zoom>=4] name,
.place[place='state'][zoom>=5] name {
  text-fill: #444;
  text-halo-fill: #fff;
  text-halo-radius: 1;
}

.place[place='country'][zoom=4] name { text-size: 9; }
.place[place='country'][zoom=5] name { text-size: 10; text-character-spacing: 1; }
.place[place='country'][zoom=6] name { text-size: 11; text-character-spacing: 2; }
.place[place='country'][zoom=7] name { text-size: 12; text-character-spacing: 3; }
.place[place='country'][zoom>=8] name { text-character-spacing: 4; text-halo-radius: 2; }
.place[place='country'][zoom=8] name { text-size: 13; }
.place[place='country'][zoom=9] name { text-size: 14; }
.place[place='country'][zoom=10] name { text-size: 15; }
.place[place='country'][zoom=11] name { text-size: 16; }

.place[place='state'][zoom=6] name { text-size: 9; }
.place[place='state'][zoom=7] name { text-size: 10; text-character-spacing: 1; }
.place[place='state'][zoom=8] name { text-size: 11; text-character-spacing: 2; }
.place[place='state'][zoom=9] name { text-size: 12; text-character-spacing: 3; }
.place[place='state'][zoom>=10] name { text-character-spacing: 4; text-halo-radius: 2; }
.place[place='state'][zoom=10] name { text-size: 13; }
.place[place='state'][zoom=11] name { text-size: 14; }
.place[place='state'][zoom=12] name { text-size: 15; }
.place[place='state'][zoom=13] name { text-size: 16; }

/* ---- medium -------------------------------------------------------------- */

.place[place='metropolis'][zoom>=6] name,
.place[place='city'][zoom>=7] name,
.place[place='large_town'][zoom>=8] name,
.place[place='town'][zoom>=9] name,
.place[place='small_town'][zoom>=10] name,
.place[place='large_village'][zoom>=11] name,
.place[place='village'][zoom>=12] name,
.place[place='hamlet'][zoom>=13] name,
.place[place='suburb'][zoom>=14] name,
.place[place='locality'][zoom>=15] name {
  text-fill: #666;
  text-halo-fill: #fff;
  text-halo-radius: 1;
  text-size: 9;
}

.place[place='metropolis'][zoom=7] name { text-size: 10; text-character-spacing: 1; }
.place[place='metropolis'][zoom=8] name { text-size: 11; text-character-spacing: 2; }
.place[place='metropolis'][zoom=9] name { text-size: 12; text-character-spacing: 3; }
.place[place='metropolis'][zoom=10] name { text-size: 13; text-character-spacing: 4; }
.place[place='metropolis'][zoom=11] name { text-size: 14; text-character-spacing: 4; }
.place[place='metropolis'][zoom=12] name { text-size: 15; text-character-spacing: 4; }
.place[place='metropolis'][zoom=13] name 
{ text-size: 16; text-character-spacing: 4; text-halo-radius: 2; }
.place[place='metropolis'][zoom=14] name
{ text-size: 17; text-character-spacing: 4; text-halo-radius: 2; }
.place[place='metropolis'][zoom=15] name
{ text-size: 18; text-character-spacing: 4; text-halo-radius: 2; }

.place[place='city'][zoom=8] name { text-size: 10; text-character-spacing: 1; }
.place[place='city'][zoom=9] name { text-size: 11; text-character-spacing: 2; }
.place[place='city'][zoom=10] name { text-size: 12; text-character-spacing: 3; }
.place[place='city'][zoom=11] name { text-size: 13; text-character-spacing: 4; }
.place[place='city'][zoom=12] name { text-size: 14; text-character-spacing: 4; }
.place[place='city'][zoom=13] name { text-size: 15; text-character-spacing: 4; }
.place[place='city'][zoom=14] name
{ text-size: 16; text-character-spacing: 4; text-halo-radius: 2; }
.place[place='city'][zoom=15] name
{ text-size: 17; text-character-spacing: 4; text-halo-radius: 2; }
.place[place='city'][zoom=16] name
{ text-size: 18; text-character-spacing: 4; text-halo-radius: 2; }

.place[place='large_town'][zoom=10] name { text-size: 10; text-character-spacing: 1; }
.place[place='large_town'][zoom=11] name { text-size: 11; text-character-spacing: 2; }
.place[place='large_town'][zoom=12] name { text-size: 12; text-character-spacing: 3; }
.place[place='large_town'][zoom=13] name { text-size: 13; text-character-spacing: 4; }
.place[place='large_town'][zoom=14] name { text-size: 14; text-character-spacing: 4; }
.place[place='large_town'][zoom=15] name { text-size: 15; text-character-spacing: 4; }
.place[place='large_town'][zoom=16] name { text-size: 16; text-character-spacing: 4; }
.place[place='large_town'][zoom=17] name { text-size: 17; text-character-spacing: 4; }
.place[place='large_town'][zoom=18] name { text-size: 18; text-character-spacing: 4; }

.place[place='town'][zoom=12] name { text-size: 10; text-character-spacing: 1; }
.place[place='town'][zoom=13] name { text-size: 11; text-character-spacing: 2; }
.place[place='town'][zoom=14] name { text-size: 12; text-character-spacing: 3; }
.place[place='town'][zoom=15] name { text-size: 13; text-character-spacing: 4; }
.place[place='town'][zoom=16] name { text-size: 14; text-character-spacing: 4; }
.place[place='town'][zoom=17] name { text-size: 15; text-character-spacing: 4; }
.place[place='town'][zoom=18] name { text-size: 16; text-character-spacing: 4; }

.place[place='small_town'][zoom=12] name { text-size: 10; text-character-spacing: 1; }
.place[place='small_town'][zoom=13] name { text-size: 11; text-character-spacing: 2; }
.place[place='small_town'][zoom=14] name { text-size: 12; text-character-spacing: 3; }
.place[place='small_town'][zoom=15] name { text-size: 13; text-character-spacing: 4; }
.place[place='small_town'][zoom=16] name { text-size: 14; text-character-spacing: 4; }
.place[place='small_town'][zoom=17] name { text-size: 15; text-character-spacing: 4; }
.place[place='small_town'][zoom=18] name { text-size: 16; text-character-spacing: 4; }

/* ---- small --------------------------------------------------------------- */

.place[place='large_village'][zoom=13] name { text-size: 10; text-character-spacing: 1; }
.place[place='large_village'][zoom=14] name { text-size: 11; text-character-spacing: 2; }
.place[place='large_village'][zoom=15] name { text-size: 12; text-character-spacing: 3; }
.place[place='large_village'][zoom=16] name { text-size: 13; text-character-spacing: 4; }
.place[place='large_village'][zoom=17] name { text-size: 14; text-character-spacing: 4; }
.place[place='large_village'][zoom=18] name { text-size: 15; text-character-spacing: 4; }

.place[place='village'][zoom=15] name { text-size: 10; text-character-spacing: 1; }
.place[place='village'][zoom=16] name { text-size: 11; text-character-spacing: 2; }
.place[place='village'][zoom=17] name { text-size: 12; text-character-spacing: 3; }
.place[place='village'][zoom=18] name { text-size: 13; text-character-spacing: 4; }

.place[place='hamlet'][zoom=15] name { text-size: 10; text-character-spacing: 1; }
.place[place='hamlet'][zoom=16] name { text-size: 11; text-character-spacing: 2; }
.place[place='hamlet'][zoom=17] name { text-size: 12; text-character-spacing: 3; }
.place[place='hamlet'][zoom=18] name { text-size: 13; text-character-spacing: 4; }

.place[place='suburb'][zoom=15] name { text-size: 10; text-character-spacing: 1; }
.place[place='suburb'][zoom=16] name { text-size: 11; text-character-spacing: 2; }
.place[place='suburb'][zoom=17] name { text-size: 12; text-character-spacing: 3; }
.place[place='suburb'][zoom=18] name { text-size: 13; text-character-spacing: 4; }

.place[place='locality'][zoom=16] name { text-size: 10; text-character-spacing: 1; }
.place[place='locality'][zoom=17] name { text-size: 11; text-character-spacing: 2; }
.place[place='locality'][zoom=18] name { text-size: 12; text-character-spacing: 3; }

.place[place='island'][zoom=16] name { text-size: 10; text-character-spacing: 1; }
.place[place='island'][zoom=17] name { text-size: 11; text-character-spacing: 2; }
.place[place='island'][zoom=18] name { text-size: 12; text-character-spacing: 3; }
