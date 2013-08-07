// Basic color palette, from which variations will be derived.
@motorway: 			#c0c8f0;
@main:     			#efe0e0;
@street:   			#fff;
@street_limited: 	#f3f3f3;

// Attachment ordering & global (style-level) settings.

#tunnel { opacity: 0.5; }

#road, #bridge { ::l { opacity: 1; } }

#road, #bridge { ::c { opacity: 0.5; } }

#road, #bridge { ::f { opacity: 1; } }


// ==================================================================
// ROAD COLORS
// ==================================================================

#road, #bridge, #tunnel {
  ['mapnik::geometry_type'=2] {
    
    // Tunnels are across 3 symbolizers on a single attachment, 
    // while #bridgeand #road are split across 3 attachments each.
    // This complicates the code but allows us to achieve nice 
    // transparency on the tunnels layer. Overlapping tunnels look
    // a bit odd, but those seem to be less common than overlapping
    // bridges.
    
    // ::l and l/ are for lines
    // ::c and c/ are for casing
    // ::f and f/ are for fill
    
    [class='motorway'],
    [class='motorway_link'] {
      #bridge::l, #road::l, #tunnel { // lines
        [zoom<=12] { l/line-color: #ddd; }
      }
      #bridge::c, #road::c, #tunnel { // casing
        [zoom>=13] { c/line-color: darken(@main,40) * 0.9; }
      }
      #bridge::f, #road::f, #tunnel { // fill
        [zoom>=13] { f/line-color: @main; f/line-cap:round; }
      }
    }
    
    [class='main'] {
      #bridge::l, #road::l, #tunnel { // lines
        [zoom<=12] { l/line-color: #ddd; }
      }
      #bridge::c, #road::c, #tunnel { // casing
        [zoom>=13] { c/line-color: darken(@main,40) * 0.9; }
      }
      #bridge::f, #road::f, #tunnel { // fill
        [zoom>=13] { f/line-color: @main; f/line-cap:round; }
      }
    }
    
    [class='street'] {
      #bridge::l, #road::l, #tunnel { // lines
        [zoom<=12] { l/line-color: #ddd; }
      }
      #bridge::c, #road::c, #tunnel { // casing
        [zoom>=13] { c/line-color: darken(@street,40) * 0.9; }
      }
      #bridge::f, #road::f, #tunnel { // fill
        [zoom>=13] { f/line-color: @street; f/line-cap:round; }
      }
    }
    
    [class='street_limited'] {
      #bridge::l, #road::l, #tunnel { // lines
        [zoom<=12] { l/line-color: #ddd; }
      }
      #bridge::c, #road::c, #tunnel { // casing
        [zoom>=13] { c/line-color: darken(@street_limited,40) * 0.9; }
      }
      #bridge::f, #road::f, #tunnel { // fill
        [zoom>=13] { f/line-color: @street_limited; f/line-cap:round; }
      }
    }
  }
}

// ==================================================================
// ROAD WIDTHS
// ==================================================================

#road, #bridge, #tunnel {
  ['mapnik::geometry_type'=2] {
    
    // The organization of this section is more verbose / repetetive
    // than absolutely necessary, but it lets you edit all the 
    // classes on a single zoom level without constantly scrolling
    // up and down the code.
    
    [zoom=12] {
      [class='motorway'] {
        #road::c, #bridge::c, #tunnel { c/line-width: 3; }
        #road::f, #bridge::f, #tunnel { f/line-width: 1.5; }
      }
      [class='motorway_link'],
      [class='main'] {
        #road::l, #bridge::l, #tunnel { l/line-width: 1.2; }
      }
      [class='street'],
      [class='street_limited'] {
        #road::l, #bridge::l, #tunnel { l/line-width: 0.5; }
      }
    }
    
    [zoom=13] {
      [class='motorway'] {
        #road::c, #bridge::c, #tunnel { c/line-width: 5; }
        #road::f, #bridge::f, #tunnel { f/line-width: 3; }
      }
      [class='motorway_link'],
      [class='main'] {
        #road::c, #bridge::c, #tunnel { c/line-width: 3; }
        #road::f, #bridge::f, #tunnel { f/line-width: 2; }
      }
      [class='street'],
      [class='street_limited'] {
        #road::l, #bridge::l, #tunnel { l/line-width: 0.5; }
      }
    }
    
    [zoom=14] {
      [class='motorway'] {
        #road::c, #bridge::c, #tunnel { c/line-width: 6; }
        #road::f, #bridge::f, #tunnel { f/line-width: 4; }
      }
      [class='motorway_link'],
      [class='main'] {
        #road::c, #bridge::c, #tunnel { c/line-width: 4; }
        #road::f, #bridge::f, #tunnel { f/line-width: 2.5; }
      }
      [class='street'],
      [class='street_limited'] {
        #road::c, #bridge::c, #tunnel { c/line-width: 3; }
        #road::f, #bridge::f, #tunnel { f/line-width: 2; }
      }
    }
    
    [zoom=15] {
      [class='motorway'] {
        #road::c, #bridge::c, #tunnel { c/line-width: 8; }
        #road::f, #bridge::f, #tunnel { f/line-width: 6; }
      }
      [class='motorway_link'],
      [class='main'] {
        #road::c, #bridge::c, #tunnel { c/line-width: 6; }
        #road::f, #bridge::f, #tunnel { f/line-width: 4; }
      }
      [class='street'],
      [class='street_limited'] {
        #road::c, #bridge::c, #tunnel { c/line-width: 4.5; }
        #road::f, #bridge::f, #tunnel { f/line-width: 3; }
      }
    }
    
    [zoom=16] {
      [class='motorway'] {
        #bridge::c, #road::c, #tunnel { c/line-width: 12; }
        #bridge::f, #road::f, #tunnel { f/line-width: 10; }
      }
      [class='motorway_link'],
      [class='main'] {
        #bridge::c, #road::c, #tunnel { c/line-width: 8; }
        #bridge::f, #road::f, #tunnel { f/line-width: 6; }
      }
      [class='street'],
      [class='street_limited'] {
        #bridge::c, #road::c, #tunnel { c/line-width: 6; }
        #bridge::f, #road::f, #tunnel { f/line-width: 4; }
      }
    }    
    [zoom=17] {
      [class='motorway'] {
        #bridge::c, #road::c, #tunnel { c/line-width: 18; }
        #bridge::f, #road::f, #tunnel { f/line-width: 16; }
      }
      [class='motorway_link'],
      [class='main'] {
        #bridge::c, #road::c, #tunnel { c/line-width: 12; }
        #bridge::f, #road::f, #tunnel { f/line-width: 10; }
      }
      [class='street'],
      [class='street_limited'] {
        #bridge::c, #road::c, #tunnel { c/line-width: 8; }
        #bridge::f, #road::f, #tunnel { f/line-width: 6; }
      }
    }
    
    [zoom>=18] {
      [class='motorway'] {
        #bridge::c, #road::c, #tunnel { c/line-width: 20; }
        #bridge::f, #road::f, #tunnel { f/line-width: 18; }
      }
      [class='motorway_link'],
      [class='main'] {
        #bridge::c, #road::c, #tunnel { c/line-width: 20; }
        #bridge::f, #road::f, #tunnel { f/line-width: 18; }
      }
      [class='street'],
      [class='street_limited'] {
        #bridge::c, #road::c, #tunnel { c/line-width: 18; }
        #bridge::f, #road::f, #tunnel { f/line-width: 16; }
      }
    }
    
  }
}


// ==================================================================
// ROAD LABELS
// ==================================================================

#road_label['mapnik::geometry_type'=2] {
  //[class='motorway'][zoom>=10],
  [class='main'][zoom>=12],
  [class='street'][zoom>=15],
  [class='street_limited'][zoom>=15] {
    text-name: @name;
    text-face-name: 'Source Sans Pro Regular';
    text-placement: line;
    text-halo-rasterizer: fast;
    text-halo-radius: 1;
    text-halo-fill: #fff;
    text-fill: #555;
    // colors
    [class='motorway'] {
      text-fill: @motorway * 0.5;
      text-halo-fill: @motorway;
    }
    [class='main'] {
      text-fill: @main * 0.5;
      text-halo-fill: @main;
    }
    // sizes
    [zoom>=16] { text-size: 12; }
    [zoom>=17] { text-size: 13; }
    [class='main'],
    [class='motorway'] {
      [zoom>=14] { text-size: 12; }
      [zoom>=15] { text-size: 13; }
      [zoom>=16] { text-size: 14; }
      [zoom>=17] { text-size: 13; }
      [zoom>=18] { text-size: 16; }
    }
  }
}