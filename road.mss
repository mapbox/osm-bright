// Basic color palette, from which variations will be derived.
@motorway: 			#c0c8f0;
@main:     			#efd8e0;
@street:   			#fff;
@street_limited: 	#f3f3f3;

// ==================================================================
// ROAD & RAIL LINES
// ==================================================================

#road, #bridge, #tunnel {
  
  ::case[zoom>=6]['mapnik::geometry_type'=2] {
    [class='motorway'] {
      line-join:round;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,3; }
      [zoom>=6] { line-width:3; line-color:#fff; }
      [zoom>=8] { line-width:4; }
      [zoom>=13] { line-width:3.5; line-color:@motorway*0.8; }
      [zoom>=14] { line-width:5; }
      [zoom>=15] { line-width:7; }
      [zoom>=16] { line-width:9; }
    }
    [class='motorway_link'][zoom>=13] {
      line-join:round;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,3; }
      [zoom>=13] { line-width:1; line-color:@motorway*0.8; }
      [zoom>=14] { line-width:3; }
      [zoom>=15] { line-width:4; }
      [zoom>=16] { line-width:5; }
    }
    [class='main'] {
      line-join:round;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,3; }
      [zoom>=6] { line-width:3; line-color:#fff; }
      [zoom>=8] { line-width:4; }
      [zoom>=13] { line-width:2.5; line-color:@main*0.9; }
      [zoom>=14] { line-width:4; }
      [zoom>=15] { line-width:5; }
      [zoom>=16] { line-width:8; }
    }
    [class='street'][zoom>=12] {
      line-join:round;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,3; }
      [zoom>=12] { line-width:1.2; line-color:#fff; }
      [zoom>=15] { line-width:4; line-color:#ddd; }
      [zoom>=16] { line-width:5; line-color:#ccc; }
    }
  }
  
  ::fill[zoom>=6]['mapnik::geometry_type'=2] {
    [class='motorway'] {
      line-join:round;
      #road, #bridge { line-cap:round; }
      //#tunnel { line-dasharray:2,4; }
      [zoom>=6] { line-width:1; line-color:@motorway; }
      [zoom>=8] { line-width:1.2; }
      [zoom>=13] { line-width:2; }
      [zoom>=14] { line-width:3.5; }
      [zoom>=15] { line-width:5; }
      [zoom>=16] { line-width:7; }
    }
    [class='motorway_link'][zoom>=14] {
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom>=14] { line-width:1.5; line-color:@motorway; }
      [zoom>=15] { line-width:2; }
      [zoom>=16] { line-width:3; }
    }
    [class='main'] {
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom>=6] { line-width:1; line-color:@main; }
      [zoom>=8] { line-width:1.2; }
      [zoom>=13] { line-width:1.5; }
      [zoom>=14] { line-width:2.5; }
      [zoom>=15] { line-width:3.5; }
      [zoom>=16] { line-width:6; }
    }
    [class='street'][zoom>=15],[class='street_limited'][zoom>=15] {
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom>=15] { line-width:2.5; line-color:#fff; }
      [zoom>=16] { line-width:4; }
    }
  }
}