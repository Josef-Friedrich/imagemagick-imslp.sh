#! /bin/sh

IMAGE=$1
WIDTH=$(identify -format %w "$IMAGE")
HEIGHT=$(identify -format %h "$IMAGE")

echo $WIDTH $HEIGHT


convert "$IMAGE" -region '10%x90%' -negate out.png

# convert "$IMAGE" -region '100%x10' -region '10x100%' -negate out.png
