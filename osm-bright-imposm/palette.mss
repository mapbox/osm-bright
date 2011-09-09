/* **************************************************************** */
/* OSM BRIGHT for ImpOSM                                            */
/* **************************************************************** */

/* For basic style customization you can simply edit the colors and
   fonts defined in this file. For more detailed / advanced 
   adjustments explore the other files. */

/* == FONTS ======================================================= */

/* We're only using @sans so far. TODO: more type variety. */
@sans:              "Arial Regular","DejaVu Sans Book";
@sans_bold:         "Arial Bold", "DejaVu Sans Bold";
@sans_italic:       "Arial Italic", "DejaVu Sans Oblique";
@sans_bold_italic:  "Arial Bold Italic", " DejaVu Sans Bold Oblique";

/* == COLOR PALETTE =============================================== */

/* ---- Lancover & Landuse ---------------------------------------- */

@land:              #fcfbe7;
@water:             #c4dff2;

@agriculture:       #f4f0e0;
@beach:             #ffeec7;
@building:          #e4e0e0;
@cemetery:          #d1d1d1;
@forest:            #c7e6a8;
@grass:             lighten(@forest,5);
@hospital:          rgb(229,198,195);
@industrial:        rgb(209,208,205);
@park:              lighten(@forest,10);
@residential:       darken(@land,5);
@school:            #FEA;
@sports:            #DED1AB;
@transport:         rgb(200,200,200);

/* ---- Roads ----------------------------------------------------- */
/* For each class of road there are three color variables:
   - line: for lower zoomlevels when the road is represented by a
           single solid line.
   - case: for higher zoomlevels, this color is for the road's
           casing (outline).
   - fill: for higher zoomlevels, this color is for the road's
           inner fill (inline). */

@motorway_line:     #12975e;
@motorway_fill:     lighten(@motorway_line,5);
@motorway_case:     darken(@motorway_line,5);

@trunk_line:        #e12631;
@trunk_fill:        lighten(@trunk_line,10);
@trunk_case:        darken(@trunk_line,5);

@primary_line:      darken(#f8cd67,20);
@primary_fill:      lighten(#f8cd67,10);
@primary_case:      @primary_line;

@secondary_line:    @primary_line;
@secondary_fill:    @primary_fill;
@secondary_case:    @primary_case;

@standard_line:     @land * 0.9;
@standard_fill:     #fff;
@standard_case:     fadeout(#000,85);

@pedestrian_line:   @standard_line;
@pedestrian_fill:   #FAFAF5;

@bridge_case:       #666;

@track:             #aaa;

@rail:              #999;
@aeroway:           rgb(180,180,180);

/* **************************************************************** */
