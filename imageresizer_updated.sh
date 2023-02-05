#!/bin/bash

echo "This is the IMAGERESIZER tool!"
echo ""

echo "Set max pixel resolution for image:"
echo "example: 500"
echo ""
read PIXEL

echo "Would you like to resize multiple files?"
echo "[Y] Yes  [N] No"

read YN

if [ $YN == "N" ];
then 
	echo "Which specific image would you like to resize?"
echo ""
read IMGNAME
echo "Boiling Water..."
sleep 2
echo "Water has reached boiling point"
sleep 1
echo ""
echo ""
sips -Z $PIXEL $IMGNAME -o "Resized_${IMGNAME}"
echo ""
echo "New image created: Resized_${IMGNAME}"

exit

fi


if [ $YN == "Y" ];

then
	echo ""
	echo "WARNING!"
	echo ""
	echo "This will effect the original files in this directory."
	echo "Backup original files to a different directory if you wish to preseve them."
echo ""
echo "Do you wish to proceed?"
echo ""
echo "[YES] or [NO]"

read CAUTION
echo ""

fi

if [ $CAUTION == "YES" ];
then 
	echo "Are they .jpeg files or .png files?"
	echo ""
read FILETYPE

else
        echo "Goodbye!"
        exit

fi
echo ""
echo "Boiling water..."
sleep 2
echo "Water has reached boiling point"
sleep 1

if [ $FILETYPE == ".jpeg" ];
then find ./ -name "*.jpg" -exec sips -Z ${PIXEL} {} \;

fi

echo ""
echo "Boiling water..."
sleep 2
echo "Water has reached boiling point"
sleep 1
 
if [ $FILETYPE == ".png" ];

then find ./ -name "*.png" -exec sips -Z ${PIXEL} {} \;

fi

echo "Done!"

