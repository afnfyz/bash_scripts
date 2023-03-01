#!/bin/bash

echo ""
echo "Find Surface Area and Volume of a Box"
read -p "Length: " length
read -p "Width: " width
read -p "Height: " height
echo ""

volume() {
    vol=$(echo "$width*$height*$length" | bc)
    echo "Volume = $vol"
}
volume

surface_area() {
    #echo treats everything as strings, if piped through | bc it can interpret arithmetic expressions. 
    surfacearea=$(echo "2*(($length*$width)+($length*$height)+($width*$height))" | bc)
    echo "Surface Area = $surfacearea"
}
surface_area
