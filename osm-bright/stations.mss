@station-color: @transportation-icon;
@station-text: darken(saturate(@station-color, 15%), 10%);

#station {
  [railway = 'station'][zoom >= 12] {
    marker-file: url('icons/rail-15.svg');
    marker-placement: interior;
    marker-fill: @station-color;
    marker-clip: false;
    [zoom<16] {
        marker-file: url('icons/rail-11.svg');
    }
    [zoom >= 14] {
      text-name: "[name]";
      text-face-name: @bold-fonts;
      text-size: 10;
      text-fill: @station-text;
      text-dy: 10;
      text-halo-radius: @standard-halo-radius * 1.5;
      text-halo-fill: @standard-halo-fill;
      text-wrap-width: 0;
      text-placement: interior;
    }
  }

  [railway = 'halt'] {
    [zoom >= 13] {
      marker-file: url('icons/rail-15.svg');
      marker-placement: interior;
      marker-fill: @station-color;
      marker-clip: false;
      [zoom<16] {
          marker-file: url('icons/rail-11.svg');
      }
    }
    [zoom >= 15] {
      text-name: "[name]";
      text-face-name: @bold-fonts;
      text-size: 10;
      text-fill: @station-text;
      text-dy: 10;
      text-halo-radius: @standard-halo-radius * 1.5;
      text-halo-fill: @standard-halo-fill;
      text-wrap-width: 0;
      text-placement: interior;
    }
  }

  [railway = 'tram_stop'] {
    [zoom >= 17] {
      marker-file: url('icons/rail-light-15.svg');
      marker-placement: interior;
      marker-fill: @transportation-icon;
      marker-clip: false;
    }
    [zoom >= 18] {
      text-name: "[name]";
      text-face-name: @book-fonts;
      text-size: 10;
      text-fill: @transportation-icon;
      text-dy: 10;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-wrap-width: 0;
      text-placement: interior;
    }
  }
    
  [railway = 'subway_entrance'][zoom >= 18] {
    marker-file: url('icons/rail-metro-15.svg');
    marker-placement: interior;
    marker-fill: @transportation-icon;
    marker-clip: false;
    [zoom >= 19] {
      text-name: [name];
      text-face-name: @book-fonts;
      text-size: 10;
      text-fill: @transportation-icon;
      text-dy: 10;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-wrap-width: 0;
      text-placement: interior;
    }
  }

}
