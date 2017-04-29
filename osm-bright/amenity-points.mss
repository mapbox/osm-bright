
// Colors and corresponding IDs in the database
@amenity-brown:  #734a08; 	// 0
@health-color: #da0092;		// 1
@landform-color: #d08f55;	// 2
@transportation-icon: #0092da;	// 3
@shop-icon: #ac39ac;		// 4



@marina-text: #576ddf; // also swimming_pool
@wetland-text: darken(#4aa5fa, 25%); /* Also for marsh and mud */
@shop-text: #939;
@transportation-text: #0066ff;
@airtransport: #8461C4;
@man-made-icon: #555;

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

#amenity_z13[zoom>=13],
#amenity_z14[zoom>=14],
#amenity_z15[zoom>=15],
#amenity_z16[zoom>=16],
#amenity_z17[zoom>=17]
{
    marker-placement: interior;
    marker-clip: false;

    [zoom<16] { marker-file: url('icons/[icon]-11.svg'); }
    [zoom>=16] { marker-file: url('icons/[icon]-15.svg'); }

    [color=0] { marker-fill: @amenity-brown; }
    [color=1] { marker-fill: @health-color; }
    [color=2] { marker-fill: @landform-color; }
    [color=3] { marker-fill: @transportation-icon; }
    [color=4] { marker-fill: @shop-icon; }
}

#amenity_z13::text[zoom>=16],
#amenity_z14::text[zoom>=17],
#amenity_z15::text[zoom>=17],
#amenity_z16::text[zoom>=17],
#amenity_z17::text[zoom>=18]
{
    text-name: "[name]";
    text-halo-radius: @standard-halo-radius;
    text-face-name: @standard-font;
    text-size: @standard-text-size;
    text-wrap-width: @standard-wrap-width;
    text-fill: @poi_text;
    text-halo-fill: @standard-halo-fill;
    text-placement: interior;
    text-dy: 11;
    
    [color = 1] {
        text-fill: @hospital * 0.6;
        text-halo-fill: lighten(@hospital, 10%);
    }
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

