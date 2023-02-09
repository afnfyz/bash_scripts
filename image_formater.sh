#!/bin/bash

echo "Welcome to The Image Formater!"

echo ""

echo "Would you like to format multiple image files?"
echo "[Y] Yes [N] No"

read ANSWR
echo ""
if [ $ANSWR == "N" ];
then
	echo "Which specific file would you like to convert?"
read SINGLEFILE
	echo ""
	echo "Which Format are you converting from?"
	echo "For example: jpeg or png etc"
	echo ""
read FROM
	echo ""
	echo "Which format would you like to convert to?"
	echo "For example: jpeg, png etc"
read CONVERT
sips -s format $CONVERT $SINGLEFILE  --out ${SINGLEFILE}.${CONVERT}
fi


if [ $ANSWR == "Y" ];
then
	echo "Which file type are you converting from?"
	echo "For example: jpeg, png etc"
read FROM
	echo ""
	echo "Which format would you like to convert to?"
	echo "For example: jpeg, png etc"
read CONVERT
for i in *.${FROM}; do sips -s format $CONVERT $i --out Converted_$i.${CONVERT};done
mkdir converted_images
mv Converted* ./converted_images
fi
