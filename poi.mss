/******************************************************************************
# Points of Interest
*******************************************************************************/
  
.amenity[zoom>=15][amenity='hospital'] name {
  text-allow-overlap: false;
  text-face-name: 'Arial Regular';
  text-fill: #999;
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
