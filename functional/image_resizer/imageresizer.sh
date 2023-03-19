#!/bin/bash

echo ""
echo "This is the IMAGERESIZER tool!"
echo ""
echo "Please navigate to the folder which contains the image(s) before proceding"
echo ""
echo "Which image would you like to resize?"
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


