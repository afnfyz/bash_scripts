#!/bin/bash

#NUMFILES=$(ls . | wc -l)
#echo ${numfiles}

read -p "Set file name: " FILENAME
read -p "How many files would you like to create? " NUM
#MAXFILENUM=$(ls | egrep -o [0-9]+ | sort -rn | head -n1)
MAXFILENUM=$(ls | grep ${FILENAME} | egrep -o [0-9]+ | sort -rn | head -n1)

for ((i=1 ; i <= $NUM; i++))
do
CURRENTFILENAME=$(($MAXFILENUM+$i))
touch ${FILENAME}${CURRENTFILENAME}.txt
done
