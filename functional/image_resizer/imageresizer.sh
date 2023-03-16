#!/bin/bash

echo "This is the IMAGERESIZER tool!"
echo "Which image would you like to resize?"
echo ""
read IMGNAME

echo "Set max pixel resolution"
echo "example: 500"
echo ""
read PIXEL

echo "Boiling water"

sips -Z $PIXEL $IMGNAME -o "Resized_${IMGNAME}"
echo ""
echo "Water has reached  boiling point."
echo ""
echo "New image created: Resized_${IMGNAME}"


