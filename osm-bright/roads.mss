/* ==================================================================
   ROAD & RAIL LINES
/* ================================================================== */

/* At lower zoomlevels, just show major automobile routes: motorways
and trunks. */

#roads_low[zoom>=5][zoom<=8] {
    [type='motorway'] { line-color: @motorway_line; }
    [type='trunk'] { line-color: @trunk_line; }
    [zoom=5] {
        [type='motorway'] { line-width: 0.4; }
        [type='trunk'] { line-width: 0.2; } }
    [zoom=6] {
        [type='motorway'] { line-width: 0.5; }
        [type='trunk'] { line-width: 0.25; } }
    [zoom=7] {
        [type='motorway'] { line-width: 0.6; }
        [type='trunk'] { line-width: 0.3; } }
    [zoom=8] {
        [type='motorway'] { line-width: 1.0; }
        [type='trunk'] { line-width: 1.0; } }
}

/* At mid-level scales start to show primary and secondary routes
as well. */

#roads_med::outline[zoom>=9][zoom<=11] {
    [type='motorway'] { line-color: @motorway_case; }
    [type='trunk'] { line-color: @trunk_case; }

    [type='motorway_link'] { line-color: @motorway_line; }
    [type='trunk_link'] { line-color: @trunk_line; }
    [type='primary'] { line-color: @primary_line; }
    [type='secondary'] { line-color: @secondary_line; }

    [zoom=9] {
        [type='motorway'],[type='trunk'] { line-width: 1.5; }
        [type='primary'],[type='secondary'],
        [type='motorway_link'],[type='trunk_link'] { line-width: 0.6; }
    }
    [zoom>=10] {
        [type='motorway'] { line-width: 3; }
        [type='trunk'] { line-width: 2.4; }
        [type='primary'],[type='secondary'],
        [type='motorway_link'],[type='trunk_link'] { line-width: 1.0; }
    }
}

#roads_med::fill {
    [type='motorway'] { line-color: @motorway_fill; }
    [type='trunk'] { line-color: @trunk_fill; }

    [type='motorway'],
    [type='trunk'] {
        [zoom>=8] { line-width:0.5; }
        [zoom>=10] { line-width:1; }
    }
}

/* At higher levels the roads become more complex. We're now showing 
more than just automobile routes - railways, footways, and cycleways
come in as well.

Road width variables that are used in road & bridge styles 

Its assumed that when the case/fill is used, case width is 1. The
width below are given for "fill" (so, case has to be drawn fill+2). If
no fill is used, the given width corresponds to the line width. At higher
zooms, delta between fill and the case increases

*/
@rdz11_maj: 1.6; @rdz11_med: 0.8; @rdz11_min: 0.4;
@rdz12_maj: 2.5; @rdz12_med: 1.2; @rdz12_min: 0.8;
@rdz13_maj: 3;   @rdz13_med: 1.5; @rdz13_min: 1;
@rdz14_maj: 4;   @rdz14_med: 2.5; @rdz14_min: 1.6;
@rdz15_maj: 6;   @rdz15_med: 4;   @rdz15_min: 2;
@rdz16_maj: 8;   @rdz16_med: 6;   @rdz16_min: 4;
@rdz17_maj: 14;  @rdz17_med: 12;  @rdz17_min: 10;
@rdz18_maj: 20;  @rdz18_med: 17;  @rdz18_min: 14;

@rdz12_moto: 2.5; @rdz12_tr: 2.3; @rdz12_pri: 1.2; @rdz12_sec: 1;   @rdz12_min: 0.8;
@rdz13_moto: 3;   @rdz13_tr: 2.5; @rdz13_pri: 1.5; @rdz13_sec: 1.5; @rdz13_min: 1;
@rdz14_moto: 4;   @rdz14_tr: 3.5; @rdz14_pri: 2.5; @rdz14_sec: 2.0; @rdz14_min: 1.6;
@rdz15_moto: 6;   @rdz15_tr: 5;   @rdz15_pri: 4;   @rdz15_sec: 3;   @rdz15_min: 2;
@rdz16_moto: 8;   @rdz16_tr: 7;   @rdz16_pri: 6;   @rdz16_sec: 5;   @rdz16_min: 4;
@rdz17_moto: 14;  @rdz17_tr: 13;  @rdz17_pri: 12;  @rdz17_sec: 11;  @rdz17_min: 10;
@rdz18_moto: 20;  @rdz18_tr: 19;  @rdz18_pri: 17;  @rdz18_sec: 16;  @rdz18_min: 14;

/* ---- Casing ----------------------------------------------- */

#roads_gen2::outline[zoom>=12][zoom<=13] {
    /* -- colors & styles -- */
    line-cap: round;
    line-join: round;
    line-color: @standard_case;
    [type='motorway'],[type='motorway_link'] { line-color: @motorway_case; }
    [type='trunk'],[type='trunk_link'] { line-color: @trunk_case; }
    [type='primary'] { line-color: @primary_case; }
    [type='secondary'] { line-color: @secondary_case; }
    [type='railway']  { line-color: fadeout(@land,50%); }
    
    [zoom=12] {
        [type='motorway'] { line-width: @rdz12_moto + 2; }
        [type='trunk'] { line-width: @rdz12_tr + 2; }
        [type='primary'] { line-width: @rdz12_pri + 2; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz12_sec + 2; }
        [type='minorroad']{ line-width: @rdz12_min; }
        [type='railway']  { line-width: 0; }
    }
    [zoom=13] {
        [type='motorway'] { line-width: @rdz13_moto + 2; }
        [type='trunk'] { line-width: @rdz13_tr + 2; }
        [type='primary'] { line-width: @rdz13_pri + 2; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz13_sec + 2; }
        [type='minorroad']{ line-width: @rdz13_min; }
        [type='railway']  { line-width: 0; }
    }
}


#roads_gen2[zoom>=12][zoom<=13] {
    /* -- colors & styles -- */
    line-cap: round;
    line-join: round;
    line-color: @standard_fill;
    [type='motorway'],[type='motorway_link'] { line-color: @motorway_fill; }
    [type='trunk'],[type='trunk_link'] { line-color: @trunk_fill; }
    [type='primary'] { line-color: @primary_fill; }
    [type='secondary'] { line-color: @secondary_fill; }
    [type='railway'] {
        line-color: @rail_line;
        line-dasharray: 1,1;
        [type='subway'] { line-opacity: 0.67; }
    }
    [type='minorroad'] {
        line-width: 0;
    }
    [zoom=12] {
        [type='motorway'] { line-width: @rdz12_moto; }
        [type='trunk'] { line-width: @rdz12_tr; }
        [type='primary'] { line-width: @rdz12_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz12_sec; }
    }
    [zoom=13] {
        [type='motorway'] { line-width: @rdz13_moto; }
        [type='trunk'] { line-width: @rdz13_tr; }
        [type='primary'] { line-width: @rdz13_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz13_sec; }
    }
}

#roads_high::outline[zoom>=14][zoom<=20] {
    /* -- colors & styles -- */
    line-cap: round;
    line-join: round;
    line-color: @standard_case;
    line-width: 0;
    [type='motorway'],[type='motorway_link'] { line-color: @motorway_case; }
    [type='trunk'],[type='trunk_link'] { line-color: @trunk_case; }
    [type='primary'] { line-color: @primary_case; }
    [type='secondary'] { line-color: @secondary_case; }
    [type='noauto'],[type='service'] { line-color: @noauto_case; }
    [type='railway']  { line-color: @rail_case; }
    
    [zoom=14] {
        [type='motorway'] { line-width: @rdz14_moto + 2; }
        [type='trunk'] { line-width: @rdz14_tr + 2; }
        [type='primary'] { line-width: @rdz14_pri + 2; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz14_sec + 2; }
        [type='minorroad']{ line-width: @rdz14_min + 2; }
    }
    [zoom=15] {
        [type='motorway'] { line-width: @rdz15_moto + 2; }
        [type='trunk'] { line-width: @rdz15_tr + 2; }
        [type='primary'] { line-width: @rdz15_pri + 2; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz15_sec + 2; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz15_min + 2; }
        [type='railway']  { line-width: 1.5 + 2; }
    }
    [zoom=16] {
        [type='motorway'] { line-width: @rdz16_moto + 2.5; }
        [type='trunk'] { line-width: @rdz16_tr + 2.5; }
        [type='primary'] { line-width: @rdz16_pri + 2.5; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz16_sec + 2.5; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz16_min + 2; }
        [type='railway']  { line-width: 2 + 2; }
    }
    [zoom>=17] {
        [type='motorway'] { line-width: @rdz17_moto + 3; }
        [type='trunk'] { line-width: @rdz17_tr + 3; }
        [type='primary'] { line-width: @rdz17_pri + 2.5; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz17_sec + 2.5; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz17_min + 2; }
        [type='railway']  { line-width: 3 + 4; }
    }
    [zoom>=18] {
        [type='motorway'] { line-width: @rdz18_moto + 4; }
        [type='trunk'] { line-width: @rdz18_tr + 4; }
        [type='primary'] { line-width: @rdz18_pri + 4; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz18_sec + 3.5; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz18_min + 3.5; }
        [type='railway']  { line-width: 4 + 6; }
    }
}


#roads_high[zoom>=14][zoom<=20] {
    /* -- colors & styles -- */
    line-color: @standard_fill;
    line-width: 0;
    line-cap: round;
    line-join: round;

    [type='motorway'],[type='motorway_link'] { line-color: @motorway_fill; }
    [type='trunk'],[type='trunk_link'] { line-color: @trunk_fill; }
    [type='primary'] { line-color: @primary_fill; }
    [type='secondary'] { line-color: @secondary_fill; }
    [type='noauto'],[type='service'] { line-color: @noauto_fill; }

    [type='path'] {
        line-color: @path_line;
        line-dasharray: 2,1;
    }
    [type='cycleway'] {
        line-color: @cycleway_line;
    }
    [type='path'], [type='cycleway'] {
        line-width: 1.0;            
        [zoom>=16] { line-width: 1.2; }
        [zoom>=17] { line-width: 1.5; }        
    }
    
    [type='railway'] {
        line-color: @rail_line;
        line-dasharray: 1,1;
        [type='subway'] { line-opacity: 0.67; }
        [zoom>15] { line-dasharray: 1,2; } 
    }
    
    [zoom=14] {
        [type='motorway'] { line-width: @rdz14_moto; }
        [type='trunk'] { line-width: @rdz14_tr; }
        [type='primary'] { line-width: @rdz14_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz14_sec; }
        [type='minorroad']{ line-width: @rdz14_min; }
        [type='service']  { line-width: @rdz14_min / 3; }
        [type='noauto']   { line-width: @rdz14_min / 4; }
        [type='railway']  { line-width: 1; }
    }
    [zoom=15] {
        [type='motorway'] { line-width: @rdz15_moto; }
        [type='trunk'] { line-width: @rdz15_tr; }
        [type='primary'] { line-width: @rdz15_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz15_sec; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz15_min; }
        [type='railway']  { line-width: 1.5; }
    }
    [zoom=16] {
        [type='motorway'] { line-width: @rdz16_moto; }
        [type='trunk'] { line-width: @rdz16_tr; }
        [type='primary'] { line-width: @rdz16_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz16_sec; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz16_min; }
        [type='railway']  { line-width: 2; }
    }
    [zoom=17] {
        [type='motorway'] { line-width: @rdz17_moto; }
        [type='trunk'] { line-width: @rdz17_tr; }
        [type='primary'] { line-width: @rdz17_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz17_sec; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz17_min; }
        [type='railway']  { line-width: 3; }
    }
    [zoom>=18] {
        [type='motorway'] { line-width: @rdz18_moto; }
        [type='trunk'] { line-width: @rdz18_tr; }
        [type='primary'] { line-width: @rdz18_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz18_sec; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz18_min; }
        [type='railway']  { line-width: 4; }
    }
}

/* ---- Tunnels -------------------------------- */
#tunnel[zoom >= 12] {
    ::outline {
        /* -- colors & styles -- */
        line-cap: butt;
        line-join: round;
        line-dasharray: 3,3;
        line-color: @standard_case;
        
        [type='motorway'],[type='motorway_link'] { line-color: @motorway_case; }
        [type='trunk'],[type='trunk_link'] { line-color: @trunk_case; }
        [type='primary'] { line-color: @primary_case; }
        [type='secondary'] { line-color: @secondary_case; }
        [type='noauto'],[type='service'] { line-color: @noauto_case; }
        [type='railway']   { line-color: @rail_case; }
        
        [zoom=12] {
            [type='motorway'] { line-width: @rdz12_moto + 2; }
            [type='trunk'] { line-width: @rdz12_tr + 2; }
            [type='primary'] { line-width: @rdz12_pri + 2; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz12_sec + 2; }
            [type='minorroad']{ line-width: @rdz12_min; }
            /* No minor bridges yet */
            [type='service']  { line-width: 0; }
            [type='noauto']   { line-width: 0; }
            [type='railway']  { line-width: 0; }
        }
        [zoom=13] {
            [type='motorway'] { line-width: @rdz13_moto + 2; }
            [type='trunk'] { line-width: @rdz13_tr + 2; }
            [type='primary'] { line-width: @rdz13_pri + 2; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz13_sec + 2; }
            [type='minorroad']{ line-width: @rdz13_min + 2; }
            /* No minor bridges yet */
            [type='service']  { line-width: 0; }
            [type='noauto']   { line-width: 0; }
            [type='railway']  { line-width: 0; }
        }
        [zoom=14] {
            [type='motorway'] { line-width: @rdz14_moto + 2; }
            [type='trunk'] { line-width: @rdz14_tr + 2; }
            [type='primary'] { line-width: @rdz14_pri + 2; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz14_sec + 2; }
            [type='minorroad']{ line-width: @rdz14_min + 2; }
            /* No minor bridges yet */
            [type='service']  { line-width: 0; }
            [type='noauto']   { line-width: 0; }
            [type='railway']  { line-width: 0; }
        }
        [zoom=15] {
            [type='motorway'] { line-width: @rdz15_moto + 2; }
            [type='trunk'] { line-width: @rdz15_tr + 2; }
            [type='primary'] { line-width: @rdz15_pri + 2; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz15_sec + 2; }
            [type='minorroad'], [type='service'], [type='noauto']
            { line-width: @rdz15_min + 2; }
            [type='railway']  { line-width: 1.5 + 2; }
        }
        [zoom=16] {
            [type='motorway'] { line-width: @rdz16_moto + 2.5; }
            [type='trunk'] { line-width: @rdz16_tr + 2.5; }
            [type='primary'] { line-width: @rdz16_pri + 2.5; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz16_sec + 2.5; }
            [type='minorroad'], [type='service'], [type='noauto']
            { line-width: @rdz16_min + 2; }
            [type='railway']  { line-width: 2 + 2; }
        }
        [zoom=17] {
            [type='motorway'] { line-width: @rdz17_moto + 3; }
            [type='trunk'] { line-width: @rdz17_tr + 3; }
            [type='primary'] { line-width: @rdz17_pri + 2.5; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz17_sec + 2.5; }
            [type='minorroad'], [type='service'], [type='noauto']
            { line-width: @rdz17_min + 2; }
            [type='railway']  { line-width: 3 + 4; }
        }
        [zoom>=18] {
            [type='motorway'] { line-width: @rdz18_moto + 4; }
            [type='trunk'] { line-width: @rdz18_tr + 4; }
            [type='primary'] { line-width: @rdz18_pri + 4; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz18_sec + 3.5; }
            [type='minorroad'], [type='service'], [type='noauto']
            { line-width: @rdz18_min + 3.5; }
            [type='railway']  { line-width: 4 + 6; }
        }        
    }

    ::inline {
        /* -- colors & styles -- */
        line-cap: butt;

        line-join: round;

        line-color: @standard_fill;
        line-width: 0;
        
        [type='motorway'],[type='motorway_link'] { line-color: lighten(@motorway_fill, 10%); }
        [type='trunk'],[type='trunk_link'] { line-color: lighten(@trunk_fill, 10%); }
        [type='primary'] { line-color: lighten(@primary_fill, 10%); }
        [type='secondary'] { line-color: lighten(@secondary_fill, 10%); }
        [type='noauto'],[type='service'] { line-color: lighten(@noauto_fill, 10%); }
        
        [type='railway'] {
            line-color: @rail_line;
            line-dasharray: 1,1;
            [type='subway'] { line-opacity: 0.67; }
            [zoom>15] { line-dasharray: 1,2; } 
        }
        // [type='service'],
        // [type='minorroad'],
        // [type='mainroad'],
        // [type='motorway'] {
        //     line-cap: round;
        //     line-join: round;
        // }
        // [type='noauto'] {
        //     line-join: round;
        // }
        /* -- widths -- */
        [zoom=12] {
            [type='motorway'] { line-width: @rdz12_moto; }
            [type='trunk'] { line-width: @rdz12_tr; }
            [type='primary'] { line-width: @rdz12_pri; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz12_sec; }
            [type='railway']  { line-width: 0.4; }
        }
        [zoom=13] {
            [type='motorway'] { line-width: @rdz13_moto; }
            [type='trunk'] { line-width: @rdz13_tr; }
            [type='primary'] { line-width: @rdz13_pri; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz13_sec; }
            [type='railway']  { line-width: 0.8; }
        }
        [zoom=14] {
            [type='motorway'] { line-width: @rdz14_moto; }
            [type='trunk'] { line-width: @rdz14_tr; }
            [type='primary'] { line-width: @rdz14_pri; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz14_sec; }
            [type='minorroad']{ line-width: @rdz14_min; }
            [type='service']  { line-width: @rdz14_min / 3; }
            [type='noauto']   { line-width: @rdz14_min / 4; }
            [type='railway']  { line-width: 1; }
        }
        [zoom=15] {
            [type='motorway'] { line-width: @rdz15_moto; }
            [type='trunk'] { line-width: @rdz15_tr; }
            [type='primary'] { line-width: @rdz15_pri; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz15_sec; }
            [type='minorroad'], [type='service'], [type='noauto']
            { line-width: @rdz15_min; }
            [type='railway']  { line-width: 1.5; }
        }
        [zoom=16] {
            [type='motorway'] { line-width: @rdz16_moto; }
            [type='trunk'] { line-width: @rdz16_tr; }
            [type='primary'] { line-width: @rdz16_pri; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz16_sec; }
            [type='minorroad'], [type='service'], [type='noauto']
            { line-width: @rdz16_min; }
            [type='railway']  { line-width: 2; }
        }
        [zoom=17] {
            [type='motorway'] { line-width: @rdz17_moto; }
            [type='trunk'] { line-width: @rdz17_tr; }
            [type='primary'] { line-width: @rdz17_pri; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz17_sec; }
            [type='minorroad'], [type='service'], [type='noauto']
            { line-width: @rdz17_min; }
            [type='railway']  { line-width: 3; }
        }
        [zoom>=18] {
            [type='motorway'] { line-width: @rdz18_moto; }
            [type='trunk'] { line-width: @rdz18_tr; }
            [type='primary'] { line-width: @rdz18_pri; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz18_sec; }
            [type='minorroad'], [type='service'], [type='noauto']
            { line-width: @rdz18_min; }
            [type='railway']  { line-width: 4; }
        }
    }
}

/* ---- Bridges -------------------------------- */
#bridge::outline[zoom>=12][zoom<=20]{
    /* -- colors & styles -- */
    line-cap: butt;
    line-join: round;
    line-color: @standard_case * 0.8;
    line-width: 0;

    [type='motorway'],[type='motorway_link'] { line-color: @motorway_case * 0.8; }
    [type='trunk'],[type='trunk_link'] { line-color: @trunk_case * 0.8; }
    [type='primary'] { line-color: @primary_case * 0.8; }
    [type='secondary'] { line-color: @secondary_case * 0.8; }
    [type='noauto'],[type='service'] { line-color: @noauto_case * 0.8; }
    [type='railway']  { line-color: @rail_case * 0.8; }
    
    /* -- widths -- */
    [zoom=12] {
        [type='motorway'] { line-width: @rdz12_moto; }
        [type='trunk'] { line-width: @rdz12_tr; }
        [type='primary'] { line-width: @rdz12_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz12_sec; }
    }
    [zoom=13] {
        [type='motorway'] { line-width: @rdz13_moto; }
        [type='trunk'] { line-width: @rdz13_tr; }
        [type='primary'] { line-width: @rdz13_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz13_sec; }
    }
    [zoom=14] {
        [type='motorway'] { line-width: @rdz14_moto + 2; }
        [type='trunk'] { line-width: @rdz14_tr + 2; }
        [type='primary'] { line-width: @rdz14_pri + 2; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz14_sec + 2; }
        [type='minorroad']{ line-width: @rdz14_min + 2; }
    }
    [zoom=15] {
        [type='motorway'] { line-width: @rdz15_moto + 2; }
        [type='trunk'] { line-width: @rdz15_tr + 2; }
        [type='primary'] { line-width: @rdz15_pri + 2; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz15_sec + 2; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz15_min + 2; }
        [type='railway']  { line-width: 1.5 + 2; }
    }
    [zoom=16] {
        [type='motorway'] { line-width: @rdz16_moto + 2.5; }
        [type='trunk'] { line-width: @rdz16_tr + 2.5; }
        [type='primary'] { line-width: @rdz16_pri + 2.5; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz16_sec + 2.5; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz16_min + 2; }
        [type='railway']  { line-width: 2 + 2; }
    }
    [zoom>=17] {
        [type='motorway'] { line-width: @rdz17_moto + 3; }
        [type='trunk'] { line-width: @rdz17_tr + 3; }
        [type='primary'] { line-width: @rdz17_pri + 2.5; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz17_sec + 2.5; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz17_min + 2; }
        [type='railway']  { line-width: 3 + 4; }
    }
    [zoom>=18] {
        [type='motorway'] { line-width: @rdz18_moto + 4; }
        [type='trunk'] { line-width: @rdz18_tr + 4; }
        [type='primary'] { line-width: @rdz18_pri + 4; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz18_sec + 3.5; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz18_min + 3.5; }
        [type='railway']  { line-width: 4 + 6; }
    }
}


#roads_high[zoom>=14][zoom<=20] {
    /* -- colors & styles -- */
    line-color: @standard_fill;
    line-width: 0;
    line-cap: round;
    line-join: round;

    [type='motorway'],[type='motorway_link'] { line-color: @motorway_fill; }
    [type='trunk'],[type='trunk_link'] { line-color: @trunk_fill; }
    [type='primary'] { line-color: @primary_fill; }
    [type='secondary'] { line-color: @secondary_fill; }
    [type='noauto'],[type='service'] { line-color: @noauto_fill; }

    [type='path'] {
        line-color: @path_line;
        line-dasharray: 2,1;
    }
    [type='cycleway'] {
        line-color: @cycleway_line;
    }
    [type='path'], [type='cycleway'] {
        line-width: 1.0;            
        [zoom>=16] { line-width: 1.2; }
        [zoom>=17] { line-width: 1.5; }        
    }
    
    [type='railway'] {
        line-color: @rail_line;
        line-dasharray: 1,1;
        [type='subway'] { line-opacity: 0.67; }
        [zoom>15] { line-dasharray: 1,2; } 
    }
    
    [zoom=14] {
        [type='motorway'] { line-width: @rdz14_moto; }
        [type='trunk'] { line-width: @rdz14_tr; }
        [type='primary'] { line-width: @rdz14_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz14_sec; }
        [type='minorroad']{ line-width: @rdz14_min; }
        [type='service']  { line-width: @rdz14_min / 3; }
        [type='noauto']   { line-width: @rdz14_min / 4; }
        [type='railway']  { line-width: 1; }
    }
    [zoom=15] {
        [type='motorway'] { line-width: @rdz15_moto; }
        [type='trunk'] { line-width: @rdz15_tr; }
        [type='primary'] { line-width: @rdz15_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz15_sec; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz15_min; }
        [type='railway']  { line-width: 1.5; }
    }
    [zoom=16] {
        [type='motorway'] { line-width: @rdz16_moto; }
        [type='trunk'] { line-width: @rdz16_tr; }
        [type='primary'] { line-width: @rdz16_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz16_sec; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz16_min; }
        [type='railway']  { line-width: 2; }
    }
    [zoom=17] {
        [type='motorway'] { line-width: @rdz17_moto; }
        [type='trunk'] { line-width: @rdz17_tr; }
        [type='primary'] { line-width: @rdz17_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz17_sec; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz17_min; }
        [type='railway']  { line-width: 3; }
    }
    [zoom>=18] {
        [type='motorway'] { line-width: @rdz18_moto; }
        [type='trunk'] { line-width: @rdz18_tr; }
        [type='primary'] { line-width: @rdz18_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz18_sec; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz18_min; }
        [type='railway']  { line-width: 4; }
    }
}

/* ---- Tunnels -------------------------------- */
#tunnel[zoom >= 12] {
    ::outline {
        /* -- colors & styles -- */
        line-cap: butt;
        line-join: round;
        line-dasharray: 3,3;
        line-color: @standard_case;
        
        [type='motorway'],[type='motorway_link'] { line-color: @motorway_case; }
        [type='trunk'],[type='trunk_link'] { line-color: @trunk_case; }
        [type='primary'] { line-color: @primary_case; }
        [type='secondary'] { line-color: @secondary_case; }
        [type='noauto'],[type='service'] { line-color: @noauto_case; }
        [type='railway']   { line-color: @rail_case; }
        
        [zoom=12] {
            [type='motorway'] { line-width: @rdz12_moto + 2; }
            [type='trunk'] { line-width: @rdz12_tr + 2; }
            [type='primary'] { line-width: @rdz12_pri + 2; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz12_sec + 2; }
            [type='minorroad']{ line-width: @rdz12_min; }
            /* No minor bridges yet */
            [type='service']  { line-width: 0; }
            [type='noauto']   { line-width: 0; }
            [type='railway']  { line-width: 0; }
        }
        [zoom=13] {
            [type='motorway'] { line-width: @rdz13_moto + 2; }
            [type='trunk'] { line-width: @rdz13_tr + 2; }
            [type='primary'] { line-width: @rdz13_pri + 2; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz13_sec + 2; }
            [type='minorroad']{ line-width: @rdz13_min + 2; }
            /* No minor bridges yet */
            [type='service']  { line-width: 0; }
            [type='noauto']   { line-width: 0; }
            [type='railway']  { line-width: 0; }
        }
        [zoom=14] {
            [type='motorway'] { line-width: @rdz14_moto + 2; }
            [type='trunk'] { line-width: @rdz14_tr + 2; }
            [type='primary'] { line-width: @rdz14_pri + 2; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz14_sec + 2; }
            [type='minorroad']{ line-width: @rdz14_min + 2; }
            /* No minor bridges yet */
            [type='service']  { line-width: 0; }
            [type='noauto']   { line-width: 0; }
            [type='railway']  { line-width: 0; }
        }
        [zoom=15] {
            [type='motorway'] { line-width: @rdz15_moto + 2; }
            [type='trunk'] { line-width: @rdz15_tr + 2; }
            [type='primary'] { line-width: @rdz15_pri + 2; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz15_sec + 2; }
            [type='minorroad'], [type='service'], [type='noauto']
            { line-width: @rdz15_min + 2; }
            [type='railway']  { line-width: 1.5 + 2; }
        }
        [zoom=16] {
            [type='motorway'] { line-width: @rdz16_moto + 2.5; }
            [type='trunk'] { line-width: @rdz16_tr + 2.5; }
            [type='primary'] { line-width: @rdz16_pri + 2.5; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz16_sec + 2.5; }
            [type='minorroad'], [type='service'], [type='noauto']
            { line-width: @rdz16_min + 2; }
            [type='railway']  { line-width: 2 + 2; }
        }
        [zoom=17] {
            [type='motorway'] { line-width: @rdz17_moto + 3; }
            [type='trunk'] { line-width: @rdz17_tr + 3; }
            [type='primary'] { line-width: @rdz17_pri + 2.5; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz17_sec + 2.5; }
            [type='minorroad'], [type='service'], [type='noauto']
            { line-width: @rdz17_min + 2; }
            [type='railway']  { line-width: 3 + 4; }
        }
        [zoom>=18] {
            [type='motorway'] { line-width: @rdz18_moto + 4; }
            [type='trunk'] { line-width: @rdz18_tr + 4; }
            [type='primary'] { line-width: @rdz18_pri + 4; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz18_sec + 3.5; }
            [type='minorroad'], [type='service'], [type='noauto']
            { line-width: @rdz18_min + 3.5; }
            [type='railway']  { line-width: 4 + 6; }
        }        
    }

    ::inline {
        /* -- colors & styles -- */
        line-cap: butt;

        line-join: round;

        line-color: @standard_fill;
        line-width: 0;
        
        [type='motorway'],[type='motorway_link'] { line-color: lighten(@motorway_fill, 10%); }
        [type='trunk'],[type='trunk_link'] { line-color: lighten(@trunk_fill, 10%); }
        [type='primary'] { line-color: lighten(@primary_fill, 10%); }
        [type='secondary'] { line-color: lighten(@secondary_fill, 10%); }
        [type='noauto'],[type='service'] { line-color: lighten(@noauto_fill, 10%); }
        
        [type='railway'] {
            line-color: @rail_line;
            line-dasharray: 1,1;
            [type='subway'] { line-opacity: 0.67; }
            [zoom>15] { line-dasharray: 1,2; } 
        }
        // [type='service'],
        // [type='minorroad'],
        // [type='mainroad'],
        // [type='motorway'] {
        //     line-cap: round;
        //     line-join: round;
        // }
        // [type='noauto'] {
        //     line-join: round;
        // }
        /* -- widths -- */
        [zoom=12] {
            [type='motorway'] { line-width: @rdz12_moto; }
            [type='trunk'] { line-width: @rdz12_tr; }
            [type='primary'] { line-width: @rdz12_pri; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz12_sec; }
            [type='railway']  { line-width: 0.4; }
        }
        [zoom=13] {
            [type='motorway'] { line-width: @rdz13_moto; }
            [type='trunk'] { line-width: @rdz13_tr; }
            [type='primary'] { line-width: @rdz13_pri; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz13_sec; }
            [type='railway']  { line-width: 0.8; }
        }
        [zoom=14] {
            [type='motorway'] { line-width: @rdz14_moto; }
            [type='trunk'] { line-width: @rdz14_tr; }
            [type='primary'] { line-width: @rdz14_pri; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz14_sec; }
            [type='minorroad']{ line-width: @rdz14_min; }
            [type='service']  { line-width: @rdz14_min / 3; }
            [type='noauto']   { line-width: @rdz14_min / 4; }
            [type='railway']  { line-width: 1; }
        }
        [zoom=15] {
            [type='motorway'] { line-width: @rdz15_moto; }
            [type='trunk'] { line-width: @rdz15_tr; }
            [type='primary'] { line-width: @rdz15_pri; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz15_sec; }
            [type='minorroad'], [type='service'], [type='noauto']
            { line-width: @rdz15_min; }
            [type='railway']  { line-width: 1.5; }
        }
        [zoom=16] {
            [type='motorway'] { line-width: @rdz16_moto; }
            [type='trunk'] { line-width: @rdz16_tr; }
            [type='primary'] { line-width: @rdz16_pri; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz16_sec; }
            [type='minorroad'], [type='service'], [type='noauto']
            { line-width: @rdz16_min; }
            [type='railway']  { line-width: 2; }
        }
        [zoom=17] {
            [type='motorway'] { line-width: @rdz17_moto; }
            [type='trunk'] { line-width: @rdz17_tr; }
            [type='primary'] { line-width: @rdz17_pri; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz17_sec; }
            [type='minorroad'], [type='service'], [type='noauto']
            { line-width: @rdz17_min; }
            [type='railway']  { line-width: 3; }
        }
        [zoom>=18] {
            [type='motorway'] { line-width: @rdz18_moto; }
            [type='trunk'] { line-width: @rdz18_tr; }
            [type='primary'] { line-width: @rdz18_pri; }
            [type='secondary'],[type='motorway_link'],[type='trunk_link']
            { line-width: @rdz18_sec; }
            [type='minorroad'], [type='service'], [type='noauto']
            { line-width: @rdz18_min; }
            [type='railway']  { line-width: 4; }
        }
    }
}

/* ---- Bridges -------------------------------- */
#bridge::outline[zoom>=12][zoom<=20]{
    /* -- colors & styles -- */
    line-cap: butt;
    line-join: round;
    line-color: @standard_case * 0.8;
    line-width: 0;

    [type='motorway'],[type='motorway_link'] { line-color: @motorway_case * 0.8; }
    [type='trunk'],[type='trunk_link'] { line-color: @trunk_case * 0.8; }
    [type='primary'] { line-color: @primary_case * 0.8; }
    [type='secondary'] { line-color: @secondary_case * 0.8; }
    [type='noauto'],[type='service'] { line-color: @noauto_case * 0.8; }
    [type='railway']  { line-color: @rail_case * 0.8; }
    
    /* -- widths -- */
    [zoom=12] {
        [type='motorway'] { line-width: @rdz12_moto; }
        [type='trunk'] { line-width: @rdz12_tr; }
        [type='primary'] { line-width: @rdz12_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz12_sec; }
    }
    [zoom=13] {
        [type='motorway'] { line-width: @rdz13_moto; }
        [type='trunk'] { line-width: @rdz13_tr; }
        [type='primary'] { line-width: @rdz13_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz13_sec; }
    }
    [zoom=14] {
        [type='motorway'] { line-width: @rdz14_moto + 2; }
        [type='trunk'] { line-width: @rdz14_tr + 2; }
        [type='primary'] { line-width: @rdz14_pri + 2; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz14_sec + 2; }
        [type='minorroad']{ line-width: @rdz14_min + 2; }
    }
    [zoom=15] {
        [type='motorway'] { line-width: @rdz15_maj + 2.5; }
        [type='mainroad'] { line-width: @rdz15_med + 2; }
        [type='minorroad']{ line-width: @rdz15_min + 2; }
        [type='service']  { line-width: @rdz15_min / 3 + 2; }
        [type='noauto']   { line-width: @rdz15_min / 4 + 2; }
        [type='railway']  { line-width: 1.5 + 2; }
    }
    [zoom=16] {
        [type='motorway'] { line-width: @rdz16_moto + 2.5; }
        [type='trunk'] { line-width: @rdz16_tr + 2.5; }
        [type='primary'] { line-width: @rdz16_pri + 2.5; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz16_sec + 2.5; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz16_min + 2; }
        [type='railway']  { line-width: 2 + 2; }
    }
    [zoom>=17] {
        [type='motorway'] { line-width: @rdz17_moto + 3; }
        [type='trunk'] { line-width: @rdz17_tr + 3; }
        [type='primary'] { line-width: @rdz17_pri + 2.5; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz17_sec + 2.5; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz17_min + 2; }
        [type='railway']  { line-width: 3 + 4; }
    }
    [zoom>=18] {
        [type='motorway'] { line-width: @rdz18_moto + 4; }
        [type='trunk'] { line-width: @rdz18_tr + 4; }
        [type='primary'] { line-width: @rdz18_pri + 4; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz18_sec + 3.5; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz18_min + 3.5; }
        [type='railway']  { line-width: 4 + 6; }
    }
}

#bridge::2line[zoom>=14][zoom<=20]{
    /* -- colors & styles -- */
    [type='noauto'] {
        line-color: @land;
        line-width: 0;
        line-join: round;
    }
    [type='railway'] {
        line-color: @land;
        line-join: round;
    }
    /* -- widths -- */
    [zoom=14] {
        [type='noauto']   { line-width: @rdz14_min / 4 + 1; }
        [type='railway']  { line-width: 1 + 1; }
    }
    [zoom=15] {
        [type='noauto']   { line-width: @rdz15_min / 4 + 1; }
        [type='railway']  { line-width: 1.5 + 1; }
    }
    [zoom=16] {
        [type='noauto']   { line-width: @rdz16_min / 4 + 1; }
        [type='railway']  { line-width: 2 + 1; }
    }
    [zoom=17] {
        [type='noauto']   { line-width: @rdz17_min / 4 + 3; }
        [type='railway']  { line-width: 3 + 2; }
    }
    [zoom>=18] {
        [type='noauto']   { line-width: @rdz18_min / 4 + 3; }
        [type='railway']  { line-width: 4 + 3; }
    }
}

#bridge::inline[zoom>=12][zoom<=20]{
    /* -- colors & styles -- */
    line-color: @standard_fill;
    line-width: 0;
    line-cap: round;
    line-join: round;

    [type='motorway'],[type='motorway_link'] { line-color: @motorway_fill; }
    [type='trunk'],[type='trunk_link'] { line-color: @trunk_fill; }
    [type='primary'] { line-color: @primary_fill; }
    [type='secondary'] { line-color: @secondary_fill; }
    [type='noauto'],[type='service'] { line-color: @noauto_fill; }

    [type='railway'] {
        line-color: @rail_line;
        line-dasharray: 1,1;
        [type='subway'] { line-opacity: 0.67; }
        [zoom>15] { line-dasharray: 1,2; } 
    }
    /* -- widths -- */
    [zoom=12] {
        [type='motorway'] { line-width: @rdz12_moto; }
        [type='trunk'] { line-width: @rdz12_tr; }
        [type='primary'] { line-width: @rdz12_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz12_sec; }
        [type='railway']  { line-width: 0.4; }
    }
    [zoom=13] {
        [type='motorway'] { line-width: @rdz13_moto; }
        [type='trunk'] { line-width: @rdz13_tr; }
        [type='primary'] { line-width: @rdz13_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz13_sec; }
        [type='railway']  { line-width: 0.8; }
    }
    [zoom=14] {
        [type='motorway'] { line-width: @rdz14_moto; }
        [type='trunk'] { line-width: @rdz14_tr; }
        [type='primary'] { line-width: @rdz14_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz14_sec; }
        [type='minorroad']{ line-width: @rdz14_min; }
        [type='service']  { line-width: @rdz14_min / 3; }
        [type='noauto']   { line-width: @rdz14_min / 4; }
        [type='railway']  { line-width: 1; }
    }
    [zoom=15] {
        [type='motorway'] { line-width: @rdz15_moto; }
        [type='trunk'] { line-width: @rdz15_tr; }
        [type='primary'] { line-width: @rdz15_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz15_sec; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz15_min; }
        [type='railway']  { line-width: 1.5; }
    }
    [zoom=16] {
        [type='motorway'] { line-width: @rdz16_moto; }
        [type='trunk'] { line-width: @rdz16_tr; }
        [type='primary'] { line-width: @rdz16_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz16_sec; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz16_min; }
        [type='railway']  { line-width: 2; }
    }
    [zoom=17] {
        [type='motorway'] { line-width: @rdz17_moto; }
        [type='trunk'] { line-width: @rdz17_tr; }
        [type='primary'] { line-width: @rdz17_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz17_sec; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz17_min; }
        [type='railway']  { line-width: 3; }
    }
    [zoom>=18] {
        [type='motorway'] { line-width: @rdz18_moto; }
        [type='trunk'] { line-width: @rdz18_tr; }
        [type='primary'] { line-width: @rdz18_pri; }
        [type='secondary'],[type='motorway_link'],[type='trunk_link']
        { line-width: @rdz18_sec; }
        [type='minorroad'], [type='service'], [type='noauto']
        { line-width: @rdz18_min; }
        [type='railway']  { line-width: 4; }
    }
}


/* ---- Turning Circles --------------------------------------------- */
#turning_circle_case[zoom>=14] {
    marker-fill:@standard_fill;
    marker-line-color:@standard_case;
    marker-line-width:2;
    marker-allow-overlap:true;
}
#turning_circle_fill[zoom>=14] {
    marker-fill:@standard_fill;
    marker-line-width:0;
    marker-line-opacity:0;
    marker-allow-overlap:true;
}
#turning_circle_case,
#turning_circle_fill {
    [zoom=14] { marker-width:@rdz14_min * 1.1; }
    [zoom=15] { marker-width:@rdz15_min * 1.1; }
    [zoom=16] { marker-width:@rdz16_min * 1.1; }
    [zoom=17] { marker-width:@rdz17_min * 1.1; }
    [zoom>=18] { marker-width:@rdz18_min * 1.1; }
}

/* ================================================================== */
/* AEROWAYS
/* ================================================================== */

#aeroway[zoom>9] {
    line-color:@aeroway;
    line-cap:butt;
    line-join:miter;
    [is_runway>0] {
        [zoom=10]{ line-width:1; }
        [zoom=11]{ line-width:2; }
        [zoom=12]{ line-width:3; }
        [zoom=13]{ line-width:5; }
        [zoom=14]{ line-width:7; }
        [zoom=15]{ line-width:11; }
        [zoom=16]{ line-width:15; }
        [zoom=17]{ line-width:19; }
        [zoom>17]{ line-width:23; }
    }
    [is_runway=0] {
        [zoom=10]{ line-width:0.2; }
        [zoom=11]{ line-width:0.2; }
        [zoom=12]{ line-width:0.2; }
        [zoom=13]{ line-width:1; }
        [zoom=14]{ line-width:1.5; }
        [zoom=15]{ line-width:2; }
        [zoom=16]{ line-width:3; }
        [zoom=17]{ line-width:4; }
        [zoom>17]{ line-width:5; }
    }
}

/******************************************************************* */
