#! /bin/sh

P=test/scans/readme

echo deskew
convert ${P}/original.png -deskew 40% ${P}/deskew.png

echo repage
convert ${P}/deskew.png -trim +repage ${P}/repage.png

echo border-lighten
./test/discovery/border-lighten.sh ${P}/repage.png ${P}/border-lighten.png

echo threshold
convert ${P}/border-lighten.png -threshold 50% ${P}/threshold.png
