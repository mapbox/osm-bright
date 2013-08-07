// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name]';

// Common Colors //
@land: lighten(#F5EDBF,7);
@water: #bfd8f0;
@park: #D5EFB9;

Map {
  background-color:@land;
}


// Political boundaries //

#admin {
  line-join: round;
  line-color: #bbe;
  [maritime=1] { line-color: darken(@water, 3%); }
  // Countries
  [admin_level=2] {
    line-width: 1.4;
    [zoom>=6] { line-width: 2; }
    [zoom>=8] { line-width: 4; }
    [disputed=1] { line-dasharray: 4,4; }
  }
  // States / Provices / Subregions
  [admin_level>=3] {
    line-width: 0.4;
    line-dasharray: 10,3,3,3;
    [zoom>=6] { line-width: 1; }
    [zoom>=8] { line-width: 2; }
    [zoom>=12] { line-width: 3; }
  }
}


// Places //

#country_label[zoom>=3] {
  text-name: @name;
  text-face-name: 'Source Sans Pro Bold';
  text-wrap-width: 100;
  text-wrap-before: true;
  text-fill: #66a;
  text-size: 12;
  [zoom>=3][scalerank=1],
  [zoom>=4][scalerank=2],
  [zoom>=5][scalerank=3],
  [zoom>=6][scalerank>3] {
    text-size: 14;
  }
  [zoom>=4][scalerank=1],
  [zoom>=5][scalerank=2],
  [zoom>=6][scalerank=3],
  [zoom>=7][scalerank>3] {
    text-size: 16;
  }
}

#country_label_line {
  line-color: #324;
  line-opacity: 0.05;
}




// Water Features //

#water {
  ::shadow {
    // Creates a 1px inset bevel effect on the water
    polygon-fill: @water * 0.85;
    polygon-geometry-transform: translate(0,-1);
  }
  polygon-fill: @water;
  [zoom<=5] {
    // Below zoom level 5 we use Natural Earth data for water,
    // which has more obvious seams that need to be hidden.
    polygon-gamma: 0.4;
  }
}

#water_label {
  [zoom<=13],  // automatic area filtering @ low zooms
  [zoom>=14][area>500000],
  [zoom>=16][area>10000],
  [zoom>=17] {
    text-name: @name;
    text-face-name: 'Source Sans Pro Italic', 'Arial Unicode MS Regular';
    text-fill: darken(@water, 30%);
    text-size: 13;
    text-wrap-width: 100;
    text-wrap-before: true;
  }
}

#waterway {
  [type='river'],
  [type='canal'] {
    line-color: @water;
    line-width: 0.5;
    [zoom>=12] { line-width: 1; }
    [zoom>=14] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
  }
  [type='stream'] {
    line-color: @water;
    line-width: 0.5;
    [zoom>=14] { line-width: 1; }
    [zoom>=16] { line-width: 2; }
    [zoom>=18] { line-width: 3; }
  }
}


// Landuse areas //

#landuse {
  [class='park'] { polygon-fill: @park; }
}

#area_label {
  [class='park'] {
    [zoom<=13],  // automatic area filtering @ low zooms
    [zoom>=14][area>500000],
    [zoom>=16][area>10000],
    [zoom>=17] {
      text-name: @name;
      text-face-name: 'Source Sans Pro Italic';
      text-fill: darken(@park, 50%);
      text-size: 13;
      text-wrap-width: 100;
      text-wrap-before: true;
    }
  }
}

#building {
  [zoom<=14] { polygon-fill: @land * 0.95; }
  [zoom>=15] {
    ::wall {
      polygon-fill: @land * 0.9;
    }
    ::roof {
      polygon-fill: @land * 0.95;
      polygon-geometry-transform: translate(0,-1);
      polygon-clip: false
    }
  }
}