
/* ****************************************************************** */
/* OSM BRIGHT for Imposm                                              */
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
@sans_lt:       "Open Sans Regular", "DejaVu Sans Book";
@sans_lt_italic:    "Open Sans Italic", "DejaVu Sans Oblique";

@sans:          "Open Sans Semibold", "DejaVu Sans Book";
@sans_italic:   "Open Sans Semibold Italic",  "DejaVu Sans Oblique";

@sans_bold:  "Open Sans Bold", "DejaVu Sans Bold";
@sans_bold_italic:  "Open Sans Bold Italic","DejaVu Sans Bold Oblique", "DejaVu Sans Oblique";

/* Some fonts are larger or smaller than others. Use this variable to
   globally increase or decrease the font sizes. */
/* Note this is only implemented for certain things so far */
@text_adjust: 0;

/* ================================================================== */
/* LANDUSE & LANDCOVER COLORS
/* ================================================================== */

@land:              #F8F4F0;
@water:             #A0C8F0;
@grass:             #DEEBBA;
@park:              #D8E8C8;
@cemetery:          #D6DED2;
@wooded:            #E9EDDF;

@building:          #EFE8E0; //#E4E0E0;
@hospital:          #FFDDEE;
@school:            #F0E8F8;
@sports:            #B8E6B8;

@residential:       @land * 0.98;
@commercial:        @land * 0.97;
@industrial:        @land * 0.96;
@parking:           #EEE;

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

@motorway_fill:     #FFCC88;
@motorway_line:     mix(@motorway_fill, #800, 75);
@motorway_case:     @motorway_line * 0.9;
@motorway_shield_fill: #333; //#fff;

@trunk_fill:        #FFEEAA;
@trunk_line:        mix(@trunk_fill, #800, 75);
@trunk_case:        @trunk_line * 0.9;

@primary_fill:      @trunk_fill;
@primary_line:      mix(@trunk_fill, #800, 75);
@primary_case:      @trunk_line * 0.9;

// @secondary_line:    @land*0.8;
// @secondary_fill:    #FFFFFF;
// @secondary_case:    @secondary_line;

@secondary_line:    @land*0.8;
@secondary_fill:    #FFEEAA;
@secondary_case:    @secondary_line;

@standard_fill:     #FFFFFF;
@standard_case:     @land*0.7;

@noauto_fill:       #EAEAE9;
@noauto_case:       @standard_case;

// @pedestrian_line:   @standard_line;
@pedestrian_fill:   #FAFAF5;
// @pedestrian_case:   @land;

@path_line:  	    #CCBBAA;
@cycleway_line:     #B42EFF;

// @cycle_line:        @standard_line;
// @cycle_fill:        #FAFAF5;
// @cycle_case:        @land;

@rail_line:         #999;
@rail_fill:         #fff;
@rail_case:         fadeout(@land,50%);
// @rail_fill:         #fff;
// @rail_case:         @land;

@aeroway:           #ddd;

/* ================================================================== */
/* BOUNDARY COLORS
/* ================================================================== */

@admin_2:           #324;

@fence_color:       #aab;
@barrier_point:     #c7c7c7;

/* ================================================================== */
/* LABEL COLORS
/* ================================================================== */

/* We set up a default halo color for places so you can edit them all
   at once or override each individually. */
@place_halo:        fadeout(#fff,34%);

@country_text:      #435;
@country_halo:      @place_halo;

@state_text:        #546;
@state_halo:        @place_halo;

@city_text:         #444;
@city_halo:         @place_halo;

@town_text:         #666;
@town_halo:         @place_halo;

@poi_text:          #888;

@area_text:	    @poi_text;
@area_halo:         @place_halo;

@road_text:         #777;
@road_halo:         #fff;

@other_text:        #888;
@other_halo:        @place_halo;

@locality_text:     #999;
@locality_halo:     @land;

/* Also used for other small places: hamlets, suburbs, localities */
@village_text:      #888;
@village_halo:      @place_halo;

/* For POIs and other styles from standard map*/
@standard-halo-radius:  1;
@standard-halo-fill: rgba(255,255,255,0.6);
@standard-wrap-width: 30;
@standard-text-size: 10;
@standard-font: @sans;
@book-fonts: @sans;
@bold-fonts: @sans_bold;
@standard-poi-font: @book-fonts;

@water-color: @water;
@airtransport: #8461C4;

// POI colors
// Colors and corresponding IDs in the database
@amenity-brown:  #734a08; 	// 0
@health-color: #da0092;		// 1
@landform-color: #d08f55;	// 2
@transportation-icon: #0092da;	// 3
@shop-icon: #ac39ac;		// 4

/* ****************************************************************** */



