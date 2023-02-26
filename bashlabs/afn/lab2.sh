#!/bin/bash

read -p "Input first color: " a
read -p "Input second color: " b

color1=$(echo -n ${a} | wc -m)
color2=$(echo -n ${b} | wc -m)

if [ ${color1} -lt ${color2} ]; then
	echo "${a} has less letters than ${b}"
elif [ ${color1} -gt ${color2} ]; then
	echo "${a} has more letters than ${b}"
else
	echo "Both colors have the same amount of letters."
fi
