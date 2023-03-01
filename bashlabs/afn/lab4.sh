#!/bin/bash

echo ""
echo "Find Surface Area, Volume and Diagonals of a Box"
read -p "Length: " l
read -p "Width: " w
read -p "Height: " h
echo ""

volume() {
    vol=$(echo "$w*$h*$l" | bc)
    echo "Volume = $vol"
}
volume


surface_area() {
    #echo treats everything as strings, if piped through | bc it can interpret arithmetic expressions. 
    #so you can do echo "3*4" | bc and the output will be 12
    sa=$(echo "2*(($l*$w)+($l*$h)+($w*$h))" | bc)
    echo "Surface Area = $sa"
}
surface_area


diagonal_base() {
    db=$(echo "sqrt(($l^2)+($w^2))" | bc -l )
    echo "Diagonal Base = $db"
}
diagonal_base

diagonal_length() {
    dl=$(echo "sqrt(($l^2)+($w^2)+($h^2))" | bc -l )
    echo "Diagonal Length = $dl"
}
diagonal_length

