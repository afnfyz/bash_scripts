#!/bin/bash

###This file allows to create multiple files with the use of a for loop.
##User is told to input the name of the file and the number of files they want to create.
##The sort picks up the highest number connected to the file and continues producing the file from there.


#NUMFILES=$(ls . | wc -l)
#echo ${numfiles}

read -p "Set file name: " FILENAME
read -p "How many files would you like to create? " NUM

#MAXFILENUM=$(ls | egrep -o [0-9]+ | sort -rn | head -n1)
#LEASTFILENUM=$(ls | grep ${FILENAME} | egrep -o [0-9]+ | sort -rn | tail -n1)

MAXFILENUM=$(ls | grep ${FILENAME} | egrep -o [0-9]+ | sort -rn | head -n1)

for ((i=1 ; i <= $NUM ; i++))
do
CURRENTFILENUM=$(($MAXFILENUM+$i))
touch ${FILENAME}${CURRENTFILENUM}.txt
done
