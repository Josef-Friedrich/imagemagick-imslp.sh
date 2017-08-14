#! /bin/sh

INPUT="$1"
OUTPUT="$2"
WIDTH=$(identify -format %w "$INPUT")
HEIGHT=$(identify -format %h "$INPUT")

LEVEL='-level 0%,30%'

########################################################################
# BORDER
########################################################################

BORDER=$(printf "%i\n" $(echo "$WIDTH * 0.02" | bc))

#BORDER=250

BORDER_TOP="$BORDER"
BORDER_RIGHT="$BORDER"
BORDER_BOTTOM="$BORDER"
BORDER_LEFT="$BORDER"

# BORDER_TOP=50
# BORDER_RIGHT=200
# BORDER_BOTTOM=300
# BORDER_LEFT=800

########################################################################
# REGION
########################################################################

REGION_TOP="\
$((WIDTH - BORDER_RIGHT))x\
${BORDER_TOP}"

REGION_RIGHT="\
${BORDER_RIGHT}x\
$((HEIGHT - BORDER_BOTTOM))\
+$((WIDTH - BORDER_RIGHT))"

REGION_BOTTOM="\
$((WIDTH - BORDER_LEFT))x\
${BORDER_BOTTOM}\
+${BORDER_LEFT}\
+$((HEIGHT - BORDER_BOTTOM))"

REGION_LEFT="\
${BORDER_LEFT}x\
$((HEIGHT - BORDER_TOP))\
+0\
+${BORDER_TOP}"

########################################################################
# command
########################################################################

[ -z "$OUTPUT" ] && OUTPUT=out.png

convert "$INPUT" \
	-region $REGION_TOP $LEVEL \
	-region $REGION_RIGHT $LEVEL \
	-region $REGION_BOTTOM $LEVEL \
	-region $REGION_LEFT $LEVEL \
	"$OUTPUT"
