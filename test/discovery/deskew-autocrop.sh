#! /bin/sh

convert "$1" \
	-set option:deskew:auto-crop true \
	-deskew 40% \
	out.png
