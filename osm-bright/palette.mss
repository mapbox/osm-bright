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

/* ================================================================== */
/* FONTS
/* ================================================================== */

/* directory to load fonts from in addition to the system directories */
Map { font-directory: url(./fonts); }

/* set up font sets for various weights and styles */
@sans_lt:           "Open Sans Regular","DejaVu Sans Book","unifont Medium";
@sans:              "Open Sans Semibold","DejaVu Sans Book","unifont Medium";
@sans_bold:         "Open Sans Bold","DejaVu Sans Bold","unifont Medium";
@sans_italic:       "Open Sans Semibold Italic","DejaVu Sans Italic","unifont Medium";
@sans_bold_italic:  "Open Sans Bold Italic","DejaVu Sans Bold Italic","unifont Medium";

/* Some fonts are larger or smaller than others. Use this variable to
   globally increase or decrease the font sizes. */
/* Note this is only implemented for certain things so far */
@text_adjust: 0;

/* ================================================================== */
/* LANDUSE & LANDCOVER COLORS
/* ================================================================== */

@land:              #fcfbe7;
@water:             #c4dff6;

@agriculture:       #F2E8B6;
@beach:             #ffeec7;
@building:          #e4e0e0;
@cemetery:          #D6DED2;
@forest:            #C3D9AD;
@grass:             lighten(@forest,5);
@hospital:          rgb(229,198,195);
@industrial:        #e8e8e8;
@park:              lighten(@forest,10);
@parking:           #eee;
@residential:       @land * 0.97;
@school:            #FFF5CC;
@sports:            #B8E6B8;

/* ================================================================== */
/* ROAD COLORS
/* ================================================================== */

/* For each class of road there are three color variables:
 * - line: for lower zoomlevels when the road is represented by a
 *         single solid line.
 * - case: for higher zoomlevels, this color is for the road's
 *         casing (outline).
 * - fill: for higher zoomlevels, this color is for the road's
 *         inner fill (inline).
 */

@motorway_line:     #E65C5C;
@motorway_fill:     lighten(@motorway_line,10%);
@motorway_case:     @motorway_line * 0.9;

@trunk_line:        #E68A5C;
@trunk_fill:        lighten(@trunk_line,10%);
@trunk_case:        @trunk_line * 0.9;

@primary_line:      #FFC859;
@primary_fill:      lighten(@primary_line,10%);
@primary_case:      @primary_line * 0.9;

@secondary_line:    #FFE873;
@secondary_fill:    lighten(@secondary_line,10%);
@secondary_case:    @secondary_line * 0.9;

@standard_line:     @land * 0.85;
@standard_fill:     #fff;
@standard_case:     @land * 0.9;

@pedestrian_line:   @standard_line;
@pedestrian_fill:   #FAFAF5;
@pedestrian_case:   @standard_case;

@cycle_line:        @standard_line;
@cycle_fill:        #FAFAF5;
@cycle_case:        @standard_case;

@bridge_case:       #444;

@track:             #aaa;

@rail_line:         #999;
@rail_fill:         #fff;
@rail_case:         #999;

@aeroway:           #ddd;

/* ================================================================== */
/* BOUNDARY COLORS
/* ================================================================== */

@admin_2:           #324;

/* ================================================================== */
/* LABEL COLORS
/* ================================================================== */

/* We set up a default halo color for places so you can edit them all
   at once or override each individually. */
@place_halo:        fadeout(#fff,25%);

@country_text:      #435;
@country_halo:      @place_halo;

@state_text:        #546;
@state_halo:        @place_halo;

@city_text:         #444;
@city_halo:         @place_halo;

@town_text:         #666;
@town_halo:         @place_halo;

/* Also used for other small places: hamlets, suburbs, localities */
@village_text:      #888;
@village_halo:      @place_halo;

/* ****************************************************************** */
