#! /bin/sh

P=test/scans/readme

echo deskew
convert ${P}/original.png -deskew 40% ${P}/deskew.png

echo repage
convert ${P}/deskew.png -trim +repage ${P}/repage.png

echo border-lighten
./test/discovery/border-lighten.sh ${P}/repage.png ${P}/border-lighten.png

echo resize
convert ${P}/border-lighten.png -resize 200% ${P}/resize.png

echo threshold
convert ${P}/resize.png -threshold 70% ${P}/threshold.png

echo repage2
convert ${P}/threshold.png -trim +repage ${P}/repage2.png

echo compress
convert ${P}/repage2.png  -compress Group4 -monochrome ${P}/compress.pdf
