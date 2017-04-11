
Wetland patterns are built from two separately generated pattern files by means of raster processing.  The basic principle is shown by the following ImageMagick commands:

```
convert -density 720 pattern.svg -morphology Erode Disk:5.3 \( +clone -fill black -draw 'color 0,0 floodfill' -negate \) +swap -morphology Erode Disk:10.3 -compose Darken -composite -scale 12.5% -depth 8 pattern_casing.png

convert -depth 8 -density 90 wetland.svg wetland_tile.png

montage wetland_tile.png wetland_tile.png wetland_tile.png wetland_tile.png -geometry 256x256+0+0 wetland_512.png

convert wetland_512.png \( pattern_casing.png -negate \) -compose Lighten -composite -threshold 50% \( +clone -negate -morphology hitandmiss peaks:1.9 \) -compose Lighten -composite +level 20%,100% wetland_pattern_bkg.png

convert -depth 8 -size 512x512 xc:"$SYMBOL" \( pattern.png -negate \) -set colorspace RGB -alpha Off -compose CopyOpacity -composite pattern_col.png

convert -depth 8 -size 512x512 xc:"$WETLAND" \( wetland_pattern_bkg.png -negate \) -set colorspace RGB -alpha Off -compose CopyOpacity -composite +compose pattern_col.png -compose Over -composite wetland_pattern.png
```
