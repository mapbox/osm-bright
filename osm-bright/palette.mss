/* ****************************************************************** */
/* OSM BRIGHT for ImpOSM                                              */
/* ****************************************************************** */

/* For basic style customization you can simply edit the colors and
 * fonts defined in this file. For more detailed / advanced
 * adjustments explore the other files.
 *
 * GENERAL NOTES
 *
 * There is a slight performance cost in rendering line-caps.  An
 * effort has been made to restrict line-cap definitions to styles
 * where the results will be visible (lines at least 2 pixels thick).
 */

/* == 1. FONTS ====================================================== */

/* We're only using @sans so far. TODO: more type variety. */
@sans:              "Arial Regular","DejaVu Sans Book";
@sans_bold:         "Arial Bold", "DejaVu Sans Bold";
@sans_italic:       "Arial Italic", "DejaVu Sans Oblique";
@sans_bold_italic:  "Arial Bold Italic", " DejaVu Sans Bold Oblique";

/* Some fonts are larger or smaller than others. Use this variable to
   globally increase or decrease the font sizes. */
@text_adjust: 0;

/* == 2. COLOR PALETTE ============================================== */

/* ---- Lancover & Landuse ------------------------------------------ */

@land:              #fcfbe7;
@water:             #c4dff2;

@agriculture:       #f4f0e0;
@beach:             #ffeec7;
@building:          #e4e0e0;
@cemetery:          #d1d1d1;
@forest:            #c7e6a8;
@grass:             lighten(@forest,5);
@hospital:          rgb(229,198,195);
@industrial:        #e8e8e8;
@park:              lighten(@forest,10);
@parking:           #eee;
@residential:       desaturate(darken(@land,5),10);
@school:            #FEA;
@sports:            #DED1AB;
@transport:         rgb(200,200,200);

/* ---- Roads ------------------------------------------------------- */
/* For each class of road there are three color variables:
 * - line: for lower zoomlevels when the road is represented by a
 *         single solid line.
 * - case: for higher zoomlevels, this color is for the road's
 *         casing (outline).
 * - fill: for higher zoomlevels, this color is for the road's
 *         inner fill (inline).
 */

@motorway_line:     #4888d8;
@motorway_fill:     lighten(@motorway_line,10%);
@motorway_case:     darken(@motorway_line,20%);

@trunk_line:        @motorway_line;
@trunk_fill:        @motorway_fill;
@trunk_case:        @motorway_case;

@primary_line:      darken(#f9cf66,20%);
@primary_fill:      lighten(#f9cf66,20%);
@primary_case:      @primary_line;

@secondary_line:    @primary_line;
@secondary_fill:    @primary_fill;
@secondary_case:    @primary_case;

@standard_line:     @land * 0.9;
@standard_fill:     #fff;
@standard_case:     fadeout(#000,90%);

@pedestrian_line:   #e4e0e0;
@pedestrian_fill:   #FAFAF5;
@pedestrian_case:   @standard_case;

@cycle_line:        rgb(229,198,195);
@cycle_fill:        #FAFAF5;
@cycle_case:        fadeout(@cycle_line, 20%);


@bridge_case:       rgba(0,0,0,0.33);

@minorbridge_case:  lighten(@bridge_case,40%);
  
@track:             #aaa;

@rail_line:         #999;
@rail_fill:         #fff;
@rail_case:         #999;

@aeroway:           rgb(180,180,180);

/* ---- Boundaries -------------------------------------------------- */

@admin_2:           #324;

/* ---- Places ------------------------------------------------------ */

@default_halo:      fadeout(#fff,25%);

@country_text:      #435;
@country_halo:      @default_halo;

/* ****************************************************************** */