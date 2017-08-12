#! /bin/sh

convert "$1" \
	-deskew 40% \
	out.png
