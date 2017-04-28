@marina-text: #576ddf; // also swimming_pool
@wetland-text: darken(#4aa5fa, 25%); /* Also for marsh and mud */
@shop-icon: #ac39ac;
@shop-text: #939;
@transportation-icon: #0092da;
@transportation-text: #0066ff;
@airtransport: #8461C4;
@health-color: #da0092;
@amenity-brown: #734a08;
@man-made-icon: #555;
@landform-color: #d08f55;

@landcover-font-size: 10;
@landcover-font-size-big: 12;
@landcover-font-size-bigger: 15;
@landcover-wrap-width-size: 25;
@landcover-wrap-width-size-big: 35;
@landcover-wrap-width-size-bigger: 45;
@landcover-face-name: @oblique-fonts;

@standard-wrap-width: 30;
@standard-text-size: 10;
@standard-font: @book-fonts;

#amenity_gen0[zoom>=13] {
    [feature = 'amenity_hospital'] {
        marker-file: url('icons/hospital-15.svg');
        marker-fill: @health-color;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'natural_peak'] {
        marker-file: url('icons/mountain-15.svg');
        marker-fill: @landform-color;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'natural_volcano'] {
        marker-file: url('icons/volcano-15.svg');
        marker-fill: #d40000;
        marker-placement: interior;
        marker-clip: false;
    }
}

#amenity_gen0::text[zoom>=16] {
    text-name: "[name]";
    text-halo-radius: @standard-halo-radius;
    text-face-name: @standard-font;
    text-size: @standard-text-size;
    text-wrap-width: @standard-wrap-width;
    text-fill: @poi_text;
    text-halo-fill: @standard-halo-fill;
    text-placement: interior;
    text-dy: 11;
    
    [feature = 'amenity_hospital'] {
        text-fill: @hospital * 0.6;
        text-halo-fill: lighten(@hospital, 10%);
    }
}

#amenity_gen1[zoom >= 14] {
     [feature = 'tourism_alpine_hut'] {
        point-file: url('icons/shelter-15.svg');
        point-placement: interior;
    }

    [feature = 'tourism_wilderness_hut'],
    [feature = 'amenity_shelter'] {
        marker-file: url('icons/shelter-15.svg');
        marker-fill: @transportation-icon;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_townhall'] {
        marker-file: url('icons/town-hall-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'tourism_museum'] {
        marker-file: url('icons/museum-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }   
}

#amenity_gen1::text[zoom>=17] {
    text-name: "[name]";
    text-halo-radius: @standard-halo-radius;
    text-face-name: @standard-font;
    text-size: @standard-text-size;
    text-wrap-width: @standard-wrap-width;
    text-fill: @poi_text;
    text-halo-fill: @standard-halo-fill;
    text-placement: interior;
    text-dy: 11;    
}

#amenity_fuel[zoom >= 12] {
    [feature = 'amenity_charging_station'] {
        marker-file: url('icons/charging-station-15.svg');
        marker-fill: @transportation-icon;
        marker-placement: interior;
        marker-clip: false;
        [zoom<16] {
            marker-file: url('icons/charging-station-11.svg');
        }
    }

    [feature = 'amenity_fuel'] {
        marker-file: url('icons/fuel-15.svg');
        marker-fill: @transportation-icon;
        marker-placement: interior;
        marker-clip: false;
        [zoom<16] {
            marker-file: url('icons/fuel-11.svg');
        }
    }
}

#amenity_fuel::text[zoom>=17] {
    text-name: "[name]";
    text-halo-radius: @standard-halo-radius;
    text-face-name: @standard-font;
    text-size: @standard-text-size;
    text-wrap-width: @standard-wrap-width;
    text-fill: @poi_text;
    text-halo-fill: @standard-halo-fill;
    text-placement: interior;
    text-dy: 11;    
}

#amenity_gen2[zoom >= 15] {
    [feature = 'highway_bus_stop'] {
        [zoom >= 16] {
            marker-file: url('icons/bus-11.svg');
            marker-fill: @transportation-icon;
            marker-placement: interior;
            marker-clip: false;
        }
    }

    [feature = 'amenity_parking'],
    [feature = 'amenity_bicycle_parking'],
    [feature = 'amenity_motorcycle_parking'] {
        [feature = 'amenity_parking'] {
            marker-file: url('icons/parking-15.svg');
        }
        [feature = 'amenity_bicycle_parking'] {
            marker-file: url('icons/bicycle-15.svg');
        }
        [feature = 'amenity_motorcycle_parking'] {
            marker-file: url('icons/motorcycle_parking.svg');
        }
        marker-placement: interior;
        marker-clip: false;
        marker-fill: @transportation-icon;
    }

    [feature = 'amenity_pharmacy'] {
        marker-file: url('icons/pharmacy-15.svg');
        marker-fill: @health-color;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'man_made_lighthouse'] {
        marker-file: url('icons/lighthouse-15.svg');
        marker-placement: interior;
        marker-clip: false;
        marker-fill: @transportation-icon;
    }

    [feature = 'tourism_camp_site'] {
        marker-file: url('icons/campsite-15.svg');
        marker-fill: @transportation-icon;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'tourism_caravan_site'] {
        marker-file: url('icons/campsite-15.svg');
        marker-placement: interior;
        marker-clip: false;
        marker-fill: @transportation-icon;
    }

    [feature = 'tourism_picnic_site'] {
        marker-file: url('icons/picnic-site-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'shop_department_store'] {
        marker-file: url('icons/shop/department_store.svg');
        marker-placement: interior;
        marker-clip: false;
        marker-fill: @shop-icon;
    }
}

#amenity_gen2::text[zoom>=17] {
    text-name: "[name]";
    text-halo-radius: @standard-halo-radius;
    text-face-name: @standard-font;
    text-size: @standard-text-size;
    text-wrap-width: @standard-wrap-width;
    text-fill: @poi_text;
    text-halo-fill: @standard-halo-fill;
    text-placement: interior;
    text-dy: 11;    
}

#amenity_points[zoom >= 16] {
    [feature = 'amenity_atm'] {
        marker-file: url('icons/atm.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_bank'] {
        marker-file: url('icons/bank-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_bar'] {
        marker-file: url('icons/bar-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_bicycle_rental'] {
        marker-file: url('icons/bicycle-share-15.svg');
        marker-fill: @transportation-icon;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_taxi'] {
        marker-file: url('icons/taxi.svg');
        marker-fill: @transportation-icon;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_cafe'] {
        marker-file: url('icons/cafe-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'tourism_artwork'] {
        marker-file: url('icons/monument-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_car_rental'] {
        marker-file: url('icons/rental_car.svg');
        marker-fill: @transportation-icon;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_cinema'] {
        marker-file: url('icons/cinema-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_fire_station'] {
        marker-file: url('icons/fire-station-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_fountain'] {
        ::basin {
            marker-fill: @water-color;
            marker-allow-overlap: true;
            marker-line-width: 0;
            marker-width: 10;
            marker-height: 10;
            marker-ignore-placement: true;
        }
        ::nozzle {
            [zoom = 17] {
                nozzle/marker-fill: @marina-text;
                nozzle/marker-line-width: 0;
                nozzle/marker-width: 3;
                nozzle/marker-height: 3;
            }
            [zoom >= 18] {
                nozzle/marker-file: url('icons/fountain.svg');
                nozzle/marker-fill: @marina-text;
                nozzle/marker-placement: interior;
                nozzle/marker-clip: false;
            }
        }
    }

    [feature = 'tourism_hostel'],
    [feature = 'tourism_hotel'],
    [feature = 'tourism_motel'] {
        marker-file: url('icons/lodging-15.svg');
        marker-placement: interior;
        marker-clip: false;
        marker-fill: @transportation-icon;
    }

    [feature = 'tourism_information'] {
        marker-file: url('icons/information-15.svg');
        marker-placement: interior;
        marker-fill: @amenity-brown;
        marker-clip: false;
    }

    [feature = 'amenity_embassy'] {
        marker-file: url('icons/embassy-15.svg');
        marker-fill: @transportation-icon;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_library'] {
        marker-file: url('icons/library-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_courthouse'] {
        marker-file: url('icons/courthouse.svg');
        marker-placement: interior;
        marker-fill: @amenity-brown;
        marker-clip: false;
    }

    [feature = 'amenity_clinic'],
    [feature = 'amenity_doctors'] {
        marker-file: url('icons/doctor-15.svg');
        marker-fill: @health-color;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_place_of_worship'] {
        marker-file: url('icons/place-of-worship-15.svg');
        marker-fill: #000000;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_police'] {
        marker-file: url('icons/police-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_post_office'] {
        marker-file: url('icons/post-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_pub'] {
        marker-file: url('icons/beer-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_biergarten'] {
        marker-file: url('icons/beer-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_restaurant'],
    [feature = 'amenity_food_court'] {
        marker-file: url('icons/restaurant-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_fast_food'] {
        marker-file: url('icons/fast-food-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_theatre'] {
        marker-file: url('icons/theatre-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_arts_centre'] {
        marker-file: url('icons/art-gallery-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'amenity_toilets'] {
        marker-file: url('icons/toilet-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'shop_supermarket'] {
        marker-file: url('icons/shop-15.svg');
        marker-placement: interior;
        marker-clip: false;
        marker-fill: @shop-icon;
    }

    [feature = 'shop_art'] {
        marker-file: url('icons/shop/art.svg');
        marker-fill: @shop-icon;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'shop_bag'] {
        marker-file: url('icons/shop/bag.svg');
        marker-fill: @shop-icon;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'shop_bakery'] {
        marker-file: url('icons/shop/bakery-15.svg');
        marker-fill: @shop-icon;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'shop_beverages'] {
        marker-file: url('icons/shop/alcohol-shop-15.svg');
        marker-placement: interior;
        marker-clip: false;
        marker-fill: @shop-icon;
    }

    [feature = 'shop_books'] {
        marker-file: url('icons/library-15.svg');
        marker-fill: @shop-icon;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'shop_butcher'] {
        marker-file: url('icons/shop-15.svg');
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'shop_coffee'] {
        marker-file: url('icons/shop/coffee.svg');
        marker-placement: interior;
        marker-clip: false;
        marker-fill: @shop-icon;
    }

    [feature = 'shop_convenience'] {
        marker-file: url('icons/shop/convenience.svg');
        marker-placement: interior;
        marker-clip: false;
        marker-fill: @shop-icon;
    }

    [feature = 'shop_deli'] {
        marker-file: url('icons/shop/deli.svg');
        marker-placement: interior;
        marker-clip: false;
        marker-fill: @shop-icon;
    }

    [feature = 'shop_doityourself'],
    [feature = 'shop_hardware'] {
        marker-file: url('icons/shop/diy.svg');
        marker-placement: interior;
        marker-clip: false;
        marker-fill: @shop-icon;
    }

    [feature = 'shop_fishmonger'],
    [feature = 'shop_seafood'] {
        [zoom >= 17] {
            marker-file: url('icons/shop/seafood.svg');
            marker-placement: interior;
            marker-clip: false;
            marker-fill: @shop-icon;
        }
    }

    [feature = 'shop_garden_centre'] {
        marker-file: url('icons/garden-center-15.svg');
        marker-placement: interior;
        marker-clip: false;
        marker-fill: @shop-icon;
    }

    [feature = 'shop_toys'] {
        marker-file: url('icons/shop/toys.svg');
        marker-fill: @shop-icon;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'shop_sports'] {
        marker-file: url('icons/shop/sports.svg');
        marker-fill: @shop-icon;
        marker-placement: interior;
        marker-clip: false;
    }

    [feature = 'leisure_water_park'] {
        marker-file: url('icons/water_park.svg');
        marker-placement: interior;
        marker-fill: @amenity-brown;
        marker-clip: false;
    }

    [feature = 'leisure_dog_park'] {
        marker-file: url('icons/shop/pet.svg');
        marker-placement: interior;
        marker-fill: @amenity-brown;
        marker-clip: false;
    }

    [feature = 'leisure_playground'] {
        marker-file: url('icons/playground-15.svg');
        marker-fill: @amenity-brown;
        marker-placement: interior;
        marker-clip: false;
    }
}

#amenity_points::text[zoom>=17] {
    text-name: "[name]";
    text-halo-radius: @standard-halo-radius;
    text-face-name: @standard-font;
    text-size: @standard-text-size;
    text-wrap-width: @standard-wrap-width;
    text-fill: @poi_text;
    text-halo-fill: @standard-halo-fill;
    text-placement: interior;
    text-dy: 11;    
}

// amenity_text_gen0[zoom>=13] {
// }

// amenity_text_gen1[zoom >= 16] {
// }

// amenity_text[zoom >= 17] {
//     [feature = 'amenity_pub'],
//     [feature = 'amenity_restaurant'],
//     [feature = 'amenity_food_court'],
//     [feature = 'amenity_cafe'],
//     [feature = 'amenity_fast_food'],
//     [feature = 'amenity_biergarten'],
//     [feature = 'amenity_bar'],
//     [feature = 'amenity_ice_cream'],
//     [feature = 'amenity_nightclub'] {
//         text-name: "[name]";
//         text-fill: @amenity-brown;
//         text-size: @standard-text-size;
//         text-dy: 11;
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//     }

//     [feature = 'amenity_library'],
//     [feature = 'tourism_museum'],
//     [feature = 'amenity_theatre'],
//     [feature = 'amenity_courthouse'],
//     [feature = 'amenity_townhall'],
//     [feature = 'amenity_cinema'],
//     [feature = 'amenity_arts_centre'] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: @amenity-brown;
//         text-dy: 13;
//         text-face-name: @standard-font;
//         [feature = 'tourism_museum'] { text-face-name: @standard-font; }
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//         [feature = 'amenity_library'],
//         [feature = 'tourism_museum'],
//         [feature = 'amenity_theatre'],
//         [feature = 'amenity_cinema'],
//         [feature = 'amenity_arts_centre'] {
//             text-dy: 11;
//         }
//     }

//     [feature = 'amenity_car_rental'][zoom >= 17],
//     [feature = 'amenity_bicycle_rental'][zoom >= 17],
//     [feature = 'leisure_slipway'][zoom >= 17] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: @transportation-text;
//         [feature = 'amenity_car_rental']     { text-dy: 10; }
//         [feature = 'amenity_bicycle_rental'] { text-dy: 10; }
//         [feature = 'leisure_slipway']        { text-dy: 13; }
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//     }

//     [feature = 'amenity_parking'][zoom >= 10][way_pixels > 900],
//     [feature = 'amenity_bicycle_parking'][zoom >= 10][way_pixels > 900],
//     [feature = 'amenity_motorcycle_parking'][zoom >= 10][way_pixels > 900] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: @transportation-text;
//         text-dy: 9;
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//         [access != ''][access != 'permissive'][access != 'yes'] {
//             text-fill: #66ccaf;
//         }
//         [feature = 'amenity_bicycle_parking'],
//         [feature = 'amenity_motorcycle_parking'] {
//             text-dy: 12;
//         }
//     }


//     [feature = 'amenity_police'][zoom >= 17],
//     [feature = 'amenity_car_wash'][zoom >= 17],
//     [feature = 'amenity_community_centre'][zoom >= 17],
//     [feature = 'amenity_social_facility'][zoom >= 17],
//     [feature = 'amenity_fire_station'][zoom >= 17],
//     [feature = 'amenity_drinking_water'][zoom >= 17],
//     [feature = 'tourism_picnic_site'][zoom >= 17],
//     [feature = 'leisure_picnic_table'][zoom >= 17],
//     [feature = 'amenity_post_office'][zoom >= 17] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: @amenity-brown;
//         text-dy: 10;
//         [feature = 'amenity_police'] { text-dy: 11; }
//         [feature = 'amenity_fire_station'] { text-dy: 11; }
//         [feature = 'amenity_post_office'] { text-dy: 11; }
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//     }

//     [feature = 'amenity_place_of_worship'][zoom >= 17] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: #000033;
//         text-dy: 12;
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//     }

//     [feature = 'natural_peak'][zoom >= 13],
//     [feature = 'natural_volcano'][zoom >= 13],
//     [feature = 'natural_saddle'][zoom >= 15],
//     [feature = 'tourism_viewpoint'][zoom >= 16] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: darken(@landform-color, 30%);
//         [feature = 'natural_volcano'] { text-fill: #d40000; }
//         text-dy: 7;
//         [feature = 'tourism_viewpoint'] { text-dy: 11; }
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//     }

//     [feature = 'man_made_cross'][zoom >= 17],
//     [feature = 'historic_wayside_cross'][zoom >= 17],
//     [feature = 'natural_cave_entrance'][zoom >= 15],
//     [feature = 'man_made_mast'][zoom >= 17],
//     [feature = 'man_made_water_tower'][zoom >= 17] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: black;
//         [feature = 'natural_cave_entrance'],
//         [feature = 'man_made_water_tower'] {
//             text-dy: 11;
//         }
//         [feature = 'man_made_cross'],
//         [feature = 'historic_wayside_cross'] {
//             text-dy: 6;
//         }
//         [feature = 'man_made_mast'] { text-dy: 10; }
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//     }

//     [feature = 'tourism_artwork'][zoom >= 17],
//     [feature = 'historic_memorial'][zoom >= 17],
//     [feature = 'man_made_obelisk'][zoom >= 16],
//     [feature = 'historic_monument'][zoom >= 16],
//     [feature = 'historic_archaeological_site'][zoom >= 17] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: @amenity-brown;
//         text-dy: 11;
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//     }

//     [feature = 'leisure_miniature_golf'][zoom >= 17],
//     [feature = 'leisure_golf_course'][zoom >= 15] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: darken(@park, 60%);
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-placement: interior;
//         text-dy: 13;
//         text-wrap-width: 40;
//     }

//     [feature = 'leisure_water_park'] {
//         [way_area >= 150000][zoom >= 14],
//         [way_area >= 80000][zoom >= 15],
//         [way_area >= 20000][zoom >= 16],
//         [zoom >= 17] {
//             text-name: "[name]";
//             text-size: @standard-text-size;
//             text-fill: darken(@park, 60%);
//             text-dy: 11;
//             text-face-name: @standard-font;
//             text-halo-radius: @standard-halo-radius;
//             text-halo-fill: @standard-halo-fill;
//             text-wrap-width: @standard-wrap-width;
//             text-placement: interior;
//         }
//     }

//     [feature = 'leisure_swimming_pool'][is_building = 'no'] {
//         [zoom >= 14][way_pixels > 3000],
//         [zoom >= 17] {
//             text-name: "[name]";
//             text-size: @landcover-font-size;
//             text-wrap-width: @landcover-wrap-width-size;
//             [way_pixels > 12000] {
//                 text-size: @landcover-font-size-big;
//                 text-wrap-width: @landcover-wrap-width-size-big;
//             }
//             [way_pixels > 48000] {
//                 text-size: @landcover-font-size-bigger;
//                 text-wrap-width: @landcover-wrap-width-size-bigger;
//             }
//             text-fill: @marina-text;
//             text-face-name: @landcover-face-name;
//             text-halo-radius: @standard-halo-radius;
//             text-halo-fill: @standard-halo-fill;
//             text-placement: interior;
//         }
//     }

//     [feature = 'leisure_playground'],
//     [feature = 'leisure_dog_park'] {
//         [way_area >= 150000][zoom >= 14],
//         [way_area >= 80000][zoom >= 15],
//         [way_area >= 20000][zoom >= 16],
//         [zoom >= 17] {
//             text-name: "[name]";
//             text-size: @standard-text-size;
//             text-dy: 13;
//             text-fill: darken(@park, 60%);
//             text-face-name: @standard-font;
//             text-halo-radius: @standard-halo-radius;
//             text-halo-fill: @standard-halo-fill;
//             text-wrap-width: @standard-wrap-width;
//             text-placement: interior;
//             [access != ''][access != 'permissive'][access != 'yes'] {
//                 text-fill: darken(@park, 50%);
//             }
//         }
//     }

//     [feature = 'landuse_military'],
//     [feature = 'natural_wood'],
//     [feature = 'landuse_forest'],
//     [feature = 'boundary_national_park'],
//     [feature = 'leisure_nature_reserve'] {
//         [zoom >= 8][way_pixels > 3000][is_building = 'no'],
//         [zoom >= 17] {  
//             text-name: "[name]";
//             text-size: @landcover-font-size;
//             text-wrap-width: @landcover-wrap-width-size;
//             [way_pixels > 12000] {
//                 text-size: @landcover-font-size-big;
//                 text-wrap-width: @landcover-wrap-width-size-big;
//             }
//             [way_pixels > 48000] {
//                 text-size: @landcover-font-size-bigger;
//                 text-wrap-width: @landcover-wrap-width-size-bigger;
//             }
//             text-face-name: @landcover-face-name;
//             text-halo-radius: @standard-halo-radius;
//             text-halo-fill: @standard-halo-fill;
//             text-placement: interior;
//             [feature = 'landuse_military'] {
//                 text-fill: darken(@military, 40%);
//             }
//             [feature = 'natural_wood'],
//             [feature = 'landuse_forest'] {
//                 text-fill: @forest-text;
//             }
//             [feature = 'boundary_national_park'],
//             [feature = 'leisure_nature_reserve'] {
//                 text-fill: darken(@park, 70%);
//             }
//         }
//     }

//     [feature = 'military_danger_area'][is_building = 'no'] {
//         [zoom >= 9][way_pixels > 3000],
//         [zoom >= 17] {
//             text-name: "[name]";
//             text-size: @landcover-font-size;
//             text-wrap-width: @landcover-wrap-width-size;
//             [way_pixels > 12000] {
//                 text-size: @landcover-font-size-big;
//                 text-wrap-width: @landcover-wrap-width-size-big;
//             }
//             [way_pixels > 48000] {
//                 text-size: @landcover-font-size-bigger;
//                 text-wrap-width: @landcover-wrap-width-size-bigger;
//             }
//             text-fill: darken(@danger_area, 40%);
//             text-face-name: @bold-fonts;
//             text-halo-radius: @standard-halo-radius;
//             text-halo-fill: @standard-halo-fill;
//             text-placement: interior;
//         }
//     }

//     [feature = 'landuse_garages'][is_building = 'no'] {
//         [zoom >= 13][way_pixels > 3000],
//         [zoom >= 17] {
//             text-name: "[name]";
//             text-size: @landcover-font-size;
//             text-wrap-width: @landcover-wrap-width-size;
//             [way_pixels > 12000] {
//                 text-size: @landcover-font-size-big;
//                 text-wrap-width: @landcover-wrap-width-size-big;
//             }
//             [way_pixels > 48000] {
//                 text-size: @landcover-font-size-bigger;
//                 text-wrap-width: @landcover-wrap-width-size-bigger;
//             }
//             text-fill: darken(@garages, 50%);
//             text-face-name: @landcover-face-name;
//             text-halo-radius: @standard-halo-radius;
//             text-halo-fill: @standard-halo-fill;
//             text-placement: interior;
//         }
//     }

//     [feature = 'natural_wetland'],
//     [feature = 'natural_marsh'],
//     [feature = 'natural_mud'],
//     [feature = 'leisure_park'],
//     [feature = 'leisure_recreation_ground'],
//     [feature = 'landuse_recreation_ground'],
//     [feature = 'landuse_village_green'],
//     [feature = 'leisure_common'],
//     [feature = 'leisure_garden'],
//     [feature = 'landuse_quarry'],
//     [feature = 'landuse_vineyard'],
//     [feature = 'landuse_orchard'],
//     [feature = 'landuse_plant_nursery'],
//     [feature = 'landuse_cemetery'],
//     [feature = 'amenity_grave_yard'],
//     [feature = 'landuse_residential'],
//     [feature = 'landuse_meadow'],
//     [feature = 'natural_grassland'],
//     [feature = 'landuse_grass'],
//     [feature = 'landuse_allotments'],
//     [feature = 'landuse_farmyard'],
//     [feature = 'landuse_farm'],
//     [feature = 'landuse_farmland'],
//     [feature = 'landuse_greenhouse_horticulture'],
//     [feature = 'shop_mall'],
//     [feature = 'landuse_retail'],
//     [feature = 'landuse_industrial'],
//     [feature = 'landuse_railway'],
//     [feature = 'landuse_commercial'],
//     [feature = 'landuse_brownfield'],
//     [feature = 'landuse_landfill'],
//     [feature = 'landuse_construction'],
//     [feature = 'tourism_caravan_site'],
//     [feature = 'tourism_theme_park'],
//     [feature = 'tourism_zoo'],
//     [feature = 'tourism_attraction'],
//     [feature = 'amenity_kindergarten'],
//     [feature = 'amenity_school'],
//     [feature = 'amenity_college'],
//     [feature = 'amenity_university'],
//     [feature = 'natural_heath'],
//     [feature = 'natural_scrub'],
//     [feature = 'natural_beach'],
//     [feature = 'natural_shoal'],
//     [feature = 'natural_reef'],
//     [feature = 'leisure_fitness_centre'],
//     [feature = 'leisure_sports_centre'],
//     [feature = 'leisure_stadium'],
//     [feature = 'leisure_track'],
//     [feature = 'leisure_dog_park'],
//     [feature = 'leisure_pitch'] {
//         [zoom >= 10][way_pixels > 3000][is_building = 'no'],
//         [zoom >= 17][is_building = 'no'],
//         [zoom >= 10][way_pixels > 3000][feature = 'shop_mall'],
//         [zoom >= 17][feature = 'shop_mall'] {
//             text-name: "[name]";
//             text-size: @landcover-font-size;
//             text-wrap-width: @landcover-wrap-width-size;
//             [way_pixels > 12000] {
//                 text-size: @landcover-font-size-big;
//                 text-wrap-width: @landcover-wrap-width-size-big;
//             }
//             [way_pixels > 48000] {
//                 text-size: @landcover-font-size-bigger;
//                 text-wrap-width: @landcover-wrap-width-size-bigger;
//             }
//             text-face-name: @landcover-face-name;
//             text-halo-radius: @standard-halo-radius;
//             text-halo-fill: @standard-halo-fill;
//             text-placement: interior;
//             [feature = 'natural_reef'],
//             [feature = 'natural_wetland'],
//             [feature = 'natural_marsh'],
//             [feature = 'natural_mud'] {
//                 text-fill: @wetland-text;
//             }
//             [feature = 'leisure_park'],
//             [feature = 'leisure_recreation_ground'],
//             [feature = 'landuse_recreation_ground'],
//             [feature = 'landuse_village_green'],
//             [feature = 'leisure_common'],
//             [feature = 'leisure_garden'] {
//                 text-fill: darken(@park, 60%);
//             }
//             [feature = 'landuse_quarry'] {
//                 text-fill: darken(@quarry, 60%);
//             }
//             [feature = 'landuse_vineyard'],
//             [feature = 'landuse_orchard'],
//             [feature = 'landuse_plant_nursery'] {
//                 text-fill: darken(@orchard, 50%);
//             }
//             [feature = 'landuse_cemetery'],
//             [feature = 'amenity_grave_yard'] {
//                 text-fill: darken(@cemetery, 50%);
//                 text-halo-radius: @standard-halo-radius * 1.5; /* extra halo needed to overpower the cemetery polygon pattern */
//             }
//             [feature = 'landuse_residential'] {
//                 text-fill: darken(@residential, 50%);
//             }
//             [feature = 'landuse_meadow'],
//             [feature = 'natural_grassland'],
//             [feature = 'landuse_grass'] {
//                 text-fill: darken(@grass, 50%);
//             }
//             [feature = 'landuse_allotments'] {
//                 text-fill: darken(@allotments, 50%);
//             }
//             [feature = 'landuse_farmyard'] {
//                 text-fill: darken(@farmyard, 50%);
//             }
//             [feature = 'landuse_farm'],
//             [feature = 'landuse_farmland'],
//             [feature = 'landuse_greenhouse_horticulture'] {
//                 text-fill: darken(@farmland, 50%);
//             }
//             [feature = 'shop_mall'],
//             [feature = 'landuse_retail'] {
//                 text-fill: darken(@retail, 50%);
//             }
//             [feature = 'landuse_industrial'],
//             [feature = 'landuse_railway'] {
//                 text-fill: darken(@industrial, 60%);
//             }
//             [feature = 'landuse_commercial'] {
//                 text-fill: darken(@commercial, 60%);
//             }
//             [feature = 'landuse_brownfield'],
//             [feature = 'landuse_landfill'],
//             [feature = 'landuse_construction'] {
//                 text-fill: darken(@construction, 50%);
//             }
//             [feature = 'tourism_caravan_site'] {
//                 text-fill: darken(@campsite, 50%);
//                 text-dy: 15;
//             }
//             [feature = 'tourism_theme_park'],
//             [feature = 'tourism_zoo'] {
//                 text-fill: @tourism;
//                 text-face-name: @bold-fonts; /*rendered bold to improve visibility since theme parks tend to have crowded backgrounds*/
//             }
//             [feature = 'tourism_attraction'] {
//                 text-fill: #660033;
//                 text-face-name: @standard-font;
//             }
//             [feature = 'amenity_kindergarten'],
//             [feature = 'amenity_school'],
//             [feature = 'amenity_college'],
//             [feature = 'amenity_university'] {
//                 text-fill: darken(@societal_amenities, 70%);
//             }
//             [feature = 'natural_heath'] {
//                 text-fill: darken(@heath, 40%);
//             }
//             [feature = 'natural_scrub'] {
//                 text-fill: darken(@scrub, 60%);
//             }
//             [feature = 'natural_beach'],
//             [feature = 'natural_shoal'] {
//                 text-fill: darken(@beach, 60%);
//             }
//             [feature = 'leisure_fitness_centre'],
//             [feature = 'leisure_sports_centre'],
//             [feature = 'leisure_stadium'] {
//                 text-fill: darken(@stadium, 70%);
//             }
//             [feature = 'leisure_dog_park'] {
//                 text-fill: darken(@park, 60%);
//                 text-halo-radius: @standard-halo-radius * 1.5; /* Extra halo needed to stand out from paw pattern. */
//                 text-halo-fill: @standard-halo-fill;
//             }
//             [feature = 'leisure_track'] {
//                 text-fill: darken(@track, 40%);
//             }
//             [feature = 'leisure_pitch'] {
//                 text-fill: darken(@pitch, 40%);
//             }
//         }
//     }

//     [feature = 'natural_bay'][zoom >= 14],
//     [feature = 'natural_spring'][zoom >= 16] {
//         text-name: "[name]";
//         text-size: 10;
//         text-fill: @water-text;
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//         [feature = 'natural_spring'] {
//             text-dy: 6;
//         }
//     }

//     [feature = 'amenity_bank'][zoom >= 17],
//     [feature = 'amenity_atm'][zoom >= 17] {
//         text-name: "[name]";
//         [feature = 'amenity_atm'] {
//             text-name: "[operator]";
//         }
//         text-size: @standard-text-size;
//         [feature = 'amenity_bank'] { text-dy: 9; }
//         [feature = 'amenity_atm']  { text-dy: 10; }
//         text-fill: @amenity-brown;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//         text-face-name: @standard-font;
//     }

//     [feature = 'tourism_alpine_hut'][zoom >= 14],
//     [feature = 'amenity_shelter'][zoom >= 17],
//     [feature = 'tourism_hotel'][zoom >= 17],
//     [feature = 'tourism_motel'][zoom >= 17],
//     [feature = 'tourism_hostel'][zoom >= 17],
//     [feature = 'tourism_chalet'][zoom >= 17],
//     [feature = 'tourism_guest_house'][zoom >= 17],
//     [feature = 'tourism_wilderness_hut'][zoom >= 14],
//     [feature = 'tourism_camp_site'][zoom >= 17] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: #0066ff;
//         text-dy: 11;
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//         [feature = 'tourism_motel'] {
//             text-dy: 13;
//         }
//         [feature = 'tourism_camp_site'] {
//             text-dy: 15;
//         }
//     }

//     [feature = 'amenity_embassy'][zoom >= 17] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: #0066ff;
//         text-dy: 10;
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//     }

//     [feature = 'amenity_taxi'][zoom >= 17] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: #0066ff;
//         text-dy: 11;
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//     }

//     [feature = 'highway_bus_stop'],
//     [feature = 'amenity_charging_station'],
//     [feature = 'amenity_fuel'],
//     [feature = 'amenity_bus_station'] {
//         [zoom >= 17] {
//             text-name: "[name]";
//             text-size: @standard-text-size;
//             text-fill: @transportation-text;
//             text-dy: 11;
//             text-face-name: @standard-font;
//             text-halo-radius: @standard-halo-radius;
//             text-halo-fill: @standard-halo-fill;
//             text-wrap-width: @standard-wrap-width;
//             text-placement: interior;
//             [feature = 'highway_bus_stop'] {
//                 text-dy: 9;
//             }
//         }
//     }

//     [feature = 'leisure_marina'][zoom >= 15] {
//         [zoom >= 10][way_pixels > 3000],
//         [zoom >= 17] {
//             text-name: "[name]";
//             text-size: @landcover-font-size;
//             text-wrap-width: @landcover-wrap-width-size;
//             [way_pixels > 12000] {
//                 text-size: @landcover-font-size-big;
//                 text-wrap-width: @landcover-wrap-width-size-big;
//             }
//             [way_pixels > 48000] {
//                 text-size: @landcover-font-size-bigger;
//                 text-wrap-width: @landcover-wrap-width-size-bigger;
//             }
//             text-fill: @marina-text;
//             text-face-name: @landcover-face-name;
//             text-halo-radius: @standard-halo-radius;
//             text-halo-fill: @standard-halo-fill;
//             text-placement: interior;
//         }
//     }

//     [feature = 'amenity_fountain'][zoom >= 17] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: @marina-text;
//         text-dy: 4;
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//         [zoom >= 18] {
//             text-dy: 10;
//         }
//     }


//     [feature = 'amenity_prison'][zoom >= 17] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: @amenity-brown;
//         text-dy: 12;
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//     }


//     [feature = 'man_made_lighthouse'][zoom >= 15] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: @transportation-text;
//         text-dy: 16;
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//     }

//     [feature = 'man_made_windmill'][zoom >= 17],
//     [feature = 'amenity_recycling'][zoom >= 17] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: @amenity-brown;
//         text-dy: 12;
//         [feature = 'amenity_recycling'] { text-dy: 10; }
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//     }

//     [feature = 'amenity_hospital'][zoom >= 16] {
//         text-name: "[name]";
//         text-fill: @health-color;
//         text-size: @standard-text-size;
//         text-dy: 10;
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//     }


//     [feature = 'amenity_clinic'],
//     [feature = 'amenity_pharmacy'],
//     [feature = 'amenity_doctors'],
//     [feature = 'amenity_dentist'],
//     [feature = 'amenity_veterinary'] {
//         [zoom >= 17] {
//             text-name: "[name]";
//             text-size: @standard-text-size;
//             text-dy: 12;
//             text-fill: @health-color;
//             text-face-name: @standard-font;
//             text-halo-radius: @standard-halo-radius;
//             text-halo-fill: @standard-halo-fill;
//             text-wrap-width: @standard-wrap-width;
//             text-placement: interior;
//         }
//     }

//     [feature = 'shop_art'],
//     [feature = 'shop_bag'],
//     [feature = 'shop_bakery'],
//     [feature = 'shop_beauty'],
//     [feature = 'shop_beverages'],
//     [feature = 'shop_books'],
//     [feature = 'shop_clothes'],
//     [feature = 'shop_coffee'],
//     [feature = 'shop_computer'],
//     [feature = 'shop_fashion'],
//     [feature = 'shop_convenience'],
//     [feature = 'shop_confectionery'],
//     [feature = 'shop_copyshop'],
//     [feature = 'shop_deli'],
//     [feature = 'shop_doityourself'],
//     [feature = 'shop_dry_cleaning'],
//     [feature = 'shop_hardware'],
//     [feature = 'shop_hairdresser'],
//     [feature = 'shop_hifi'],
//     [feature = 'shop_ice_cream'],
//     [feature = 'shop_butcher'],
//     [feature = 'shop_car'],
//     [feature = 'shop_car_repair'],
//     [feature = 'shop_car_parts'],
//     [feature = 'shop_cosmetics'],
//     [feature = 'shop_bicycle'],
//     [feature = 'shop_farm'],
//     [feature = 'shop_fishmonger'],
//     [feature = 'shop_florist'],
//     [feature = 'shop_garden_centre'],
//     [feature = 'shop_greengrocer'],
//     [feature = 'shop_pet'],
//     [feature = 'shop_photo'],
//     [feature = 'shop_photo_studio'],
//     [feature = 'shop_photography'],
//     [feature = 'shop_shoes'],
//     [feature = 'shop_gift'],
//     [feature = 'shop_electronics'],
//     [feature = 'shop_alcohol'],
//     [feature = 'shop_optician'],
//     [feature = 'shop_outdoor'],
//     [feature = 'shop_perfumery'],
//     [feature = 'shop_furniture'],
//     [feature = 'shop_kiosk'],
//     [feature = 'shop_mobile_phone'],
//     [feature = 'shop_motorcycle'],
//     [feature = 'shop_musical_instrument'],
//     [feature = 'shop_newsagent'],
//     [feature = 'shop_jewelry'],
//     [feature = 'shop_jewellery'],
//     [feature = 'shop_laundry'],
//     [feature = 'shop_chemist'],
//     [feature = 'shop_toys'],
//     [feature = 'shop_travel_agency'],
//     [feature = 'shop_seafood'],
//     [feature = 'shop_sports'],
//     [feature = 'shop_stationery'],
//     [feature = 'shop_tobacco'],
//     [feature = 'shop_tea'],
//     [feature = 'shop_variety_store'],
//     [feature = 'shop_wine'],
//     [feature = 'shop_other']{
//         [way_pixels > 3000][zoom >= 17],
//         [zoom >= 18] {
//             text-name: "[name]";
//             text-size: @standard-text-size;
//             text-dy: 12;
//             text-fill: @shop-text;
//             text-face-name: @standard-font;
//             text-halo-radius: @standard-halo-radius;
//             text-halo-fill: rgba(255, 255, 255, 0.6);
//             text-wrap-width: @standard-wrap-width;
//             text-placement: interior;
//             [feature = 'shop_car_repair'] {
//                 text-fill: @amenity-brown;
//             }
//         }
//     }

//     [feature = 'shop_supermarket'],
//     [feature = 'shop_department_store'] {
//         [zoom >= 16] {
//             text-name: "[name]";
//             text-size: @standard-text-size;
//             text-dy: 12;
//             text-fill: @shop-text;
//             text-face-name: @standard-font;
//             text-halo-radius: @standard-halo-radius;
//             text-halo-fill: rgba(255, 255, 255, 0.6);
//             text-wrap-width: @standard-wrap-width;
//             text-placement: interior;
//         }
//     }

//     [feature = 'aeroway_gate'][zoom >= 17] {
//         text-name: "[ref]";
//         text-size: @standard-text-size;
//         text-fill: #aa66cc;
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-wrap-width: @standard-wrap-width;
//         text-placement: interior;
//     }

//     [feature = 'power_plant'][is_building = 'no'][zoom >= 10],
//     [feature = 'power_station'][is_building = 'no'][zoom >= 10],
//     [feature = 'power_generator'][is_building = 'no'][zoom >= 10],
//     [feature = 'power_sub_station'][is_building = 'no'][zoom >= 13],
//     [feature = 'power_substation'][is_building = 'no'][zoom >= 13]{
//         [way_pixels > 3000],
//         [zoom >= 17] {
//             text-name: "[name]";
//             text-size: @landcover-font-size;
//             text-wrap-width: @landcover-wrap-width-size;
//             [way_pixels > 12000] {
//                 text-size: @landcover-font-size-big;
//                 text-wrap-width: @landcover-wrap-width-size-big;
//             }
//             [way_pixels > 48000] {
//                 text-size: @landcover-font-size-bigger;
//                 text-wrap-width: @landcover-wrap-width-size-bigger;
//             }
//             text-fill: darken(@power, 40%);
//             text-face-name: @landcover-face-name;
//             text-halo-radius: @standard-halo-radius;
//             text-halo-fill: @standard-halo-fill;
//             text-placement: interior;
//         }
//     }

//     [feature = 'natural_scree'],
//     [feature = 'natural_shingle'],
//     [feature = 'natural_bare_rock'],
//     [feature = 'natural_sand'] {
//         [zoom >= 9][way_pixels > 3000][is_building = 'no'],
//         [zoom >= 17][is_building = 'no'] {
//             text-name: "[name]";
//             text-size: @landcover-font-size;
//             text-wrap-width: @landcover-wrap-width-size;
//             [way_pixels > 12000] {
//                 text-size: @landcover-font-size-big;
//                 text-wrap-width: @landcover-wrap-width-size-big;
//             }
//             [way_pixels > 48000] {
//                 text-size: @landcover-font-size-bigger;
//                 text-wrap-width: @landcover-wrap-width-size-bigger;
//             }
//             text-face-name: @landcover-face-name;
//             text-halo-radius: @standard-halo-radius;
//             text-halo-fill: @standard-halo-fill;
//             text-placement: interior;
//             [feature = 'natural_scree'],
//             [feature = 'natural_shingle'],
//             [feature = 'natural_bare_rock'] {
//                 text-fill: darken(@bare_ground, 50%);
//             }
//             [feature = 'natural_sand'] {
//                 text-fill: darken(@sand, 50%);
//             }
//         }
//     }

//     [feature = 'aeroway_apron'][is_building = 'no'] {
//         [zoom >= 10][way_pixels > 3000],
//         [zoom >= 17] {
//             text-name: "[name]";
//             text-size: @landcover-font-size;
//             text-wrap-width: @landcover-wrap-width-size;
//             [way_pixels > 12000] {
//                 text-size: @landcover-font-size-big;
//                 text-wrap-width: @landcover-wrap-width-size-big;
//             }
//             [way_pixels > 48000] {
//                 text-size: @landcover-font-size-bigger;
//                 text-wrap-width: @landcover-wrap-width-size-bigger;
//             }
//             text-fill: darken(@apron, 60%);
//             text-face-name: @landcover-face-name;
//             text-halo-radius: @standard-halo-radius;
//             text-halo-fill: @standard-halo-fill;
//             text-placement: interior;
//         }
//     }

//     [feature = 'highway_services'][is_building = 'no'],
//     [feature = 'highway_rest_area'][is_building = 'no'] {
//         [zoom >= 10][way_pixels > 3000],
//         [zoom >= 17] {
//             text-name: "[name]";
//             text-size: @landcover-font-size;
//             text-wrap-width: @landcover-wrap-width-size;
//             [way_pixels > 12000] {
//                 text-size: @landcover-font-size-big;
//                 text-wrap-width: @landcover-wrap-width-size-big;
//             }
//             [way_pixels > 48000] {
//                 text-size: @landcover-font-size-bigger;
//                 text-wrap-width: @landcover-wrap-width-size-bigger;
//             }
//             text-fill: darken(@rest_area, 40%);
//             text-face-name: @landcover-face-name;
//             text-halo-radius: @standard-halo-radius;
//             text-halo-fill: @standard-halo-fill;
//             text-placement: interior;
//         }
//     }

//     [feature = 'natural_glacier'][is_building = 'no'] {
//         [zoom >= 8][way_pixels > 10000],
//         [zoom >= 10][way_pixels > 750],
//         [zoom >= 17] {
//             text-name: "[name]";
//             text-size: @landcover-font-size;
//             text-wrap-width: @landcover-wrap-width-size;
//             [way_pixels > 12000] {
//                 text-size: @landcover-font-size-big;
//                 text-wrap-width: @landcover-wrap-width-size-big;
//             }
//             [way_pixels > 48000] {
//                 text-size: @landcover-font-size-bigger;
//                 text-wrap-width: @landcover-wrap-width-size-bigger;
//             }
//             text-fill: mix(darken(@glacier, 40%), darken(@glacier-line, 30%), 50%);
//             text-face-name: @landcover-face-name;
//             text-halo-radius: @standard-halo-radius;
//             text-halo-fill: @standard-halo-fill;
//             text-placement: interior;
//         }
//     }

//     [feature = 'aeroway_helipad'][zoom >= 16] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: @airtransport;
//         text-dy: -10;
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-placement: interior;
//         text-wrap-width: @standard-wrap-width;
//     }

//     [feature = 'aeroway_aerodrome'][zoom >= 10][zoom < 14] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: darken(@airtransport, 15%);
//         text-dy: -10;
//         text-face-name: @oblique-fonts;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-placement: interior;
//         text-wrap-width: @standard-wrap-width;
//     }

//     [feature = 'amenity_hunting_stand'][zoom >= 17] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-dy: 11;
//         text-fill: @man-made-icon;
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-placement: interior;
//         text-wrap-width: @standard-wrap-width;
//     }

//     [feature = 'natural_tree'][zoom >= 17] {
//         text-name: "[name]";
//         text-size: @standard-text-size;
//         text-fill: green;
//         text-dy: 7;
//         [zoom >= 18] { text-dy: 8; }
//         [zoom >= 19] { text-dy: 11; }
//         [zoom >= 20] { text-dy: 18; }
//         text-face-name: @standard-font;
//         text-halo-radius: @standard-halo-radius;
//         text-halo-fill: @standard-halo-fill;
//         text-placement: interior;
//         text-wrap-width: @standard-wrap-width;
//     }
// }
