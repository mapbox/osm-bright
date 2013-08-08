@sans: 'Source Sans Pro Regular';
@sans_md: 'Source Sans Pro Semibold';
@Sand_bd: 'Source Sans Pro Bold';

#place_label {
  [type='city'][zoom<=15] {
    text-name: @name;
    text-face-name: @sans_md;
    text-fill: #846;
    text-size: 16;
    text-wrap-width: 100;
    text-wrap-before: true;
    text-halo-fill: @land;
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    [zoom>=10] { text-size: 18; }
    [zoom>=12] { text-size: 24; }
  }
  [type='town'][zoom<=17] {
    text-name: @name;
    text-face-name: 'Source Sans Pro Regular';
    text-fill: #867;
    text-size: 14;
    text-wrap-width: 100;
    text-halo-fill: @land;
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    text-wrap-before: true;
    [zoom>=12] { text-size: 16; }
    [zoom>=14] { text-size: 18; }
  }
  [type='village'] {
    text-name: @name;
    text-face-name: 'Source Sans Pro Regular';
    text-fill: #444;
    text-size: 12;
    text-wrap-width: 100;
    text-wrap-before: true;
    [zoom>=12] { text-size: 14; }
    [zoom>=14] { text-size: 18; }
  }
  [type='hamlet'],
  [type='suburb'],
  [type='neighbourhood'] {
    text-name: @name;
    text-face-name: 'Source Sans Pro Semibold';
    text-fill: #a98;
    text-transform: uppercase;
    text-character-spacing: 1;
    text-size: 10;
    text-wrap-width: 100;
    text-wrap-before: true;
    text-halo-fill: @land;
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    [zoom>=14] { text-size: 11; }
    [zoom>=15] { text-size: 12; text-character-spacing: 2; }
    [zoom>=16] { text-size: 14; text-character-spacing: 3; }
  }
}