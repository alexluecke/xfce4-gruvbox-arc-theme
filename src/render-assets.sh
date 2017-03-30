#! /bin/bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

SRC_FILE="assets.svg"
DARK_SRC_FILE="assets-dark.svg"
ASSETS_DIR="assets"
DARK_ASSETS_DIR="assets-dark"

INDEX="assets.txt"

for i in `cat $INDEX`
do 
if [ -f $DARK_ASSETS_DIR/$i.png ]; then
	rm $DARK_ASSETS_DIR/$i.png;
fi

echo
echo Rendering $DARK_ASSETS_DIR/$i.png
$INKSCAPE --export-id=$i \
    --export-id-only \
    --export-dpi=160 \
    --export-png=$DARK_ASSETS_DIR/$i.png $DARK_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $DARK_ASSETS_DIR/$i.png 
done


cp $DARK_ASSETS_DIR/* ../xfwm4/.;

exit 0
