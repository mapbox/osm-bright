#airport[zoom>=8][hasiata>0] {    
    marker-file: url('symbols/aerodrome.12.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-fill: @airtransport;
}

#airport[zoom>=14][hasiata=0] {    
    marker-file: url('symbols/aerodrome.12.svg');
    marker-placement: interior;
    marker-clip: false;
    marker-fill: @airtransport;
}

#airport::text[zoom>=10][zoom<15][hasiata>0] {
    text-name: "[iata]";
    text-halo-radius: @standard-halo-radius;
    text-face-name: @sans_bold;
    text-size: @standard-text-size;
    text-fill: @poi_text;
    text-halo-fill: @standard-halo-fill;
    text-placement: interior;
    text-dy: -10;
}

#airport::text[zoom>=15] {
    text-name: "[name]";
    text-halo-radius: @standard-halo-radius;
    text-face-name: @sans_bold;
    text-size: @standard-text-size;
    text-fill: @poi_text;
    text-halo-fill: @standard-halo-fill;
    text-placement: interior;
    text-dy: -10;
}
