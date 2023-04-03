#!/bin/bash

num=$((1 + $RANDOM % 15))

i=1
while [[ $i -le 5 ]]
do
read -p "Guess which number I am thinking of between 1 and 15: " input

if [[ $input == $num ]]
then 
echo "That is correct! I was thinking of ${num}"
break
else 
echo "That is incorrect."

((i++))
fi

if [[ $i -eq 6 ]]
then
echo "I was actually thinking of ${num}."
fi

done

