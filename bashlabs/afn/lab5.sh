#!/bin/bash

file="./files/lab5.txt"

# Declare an empty array
my_array=()

# Read the file into the array
i=0
while read -r line; do
  my_array[i++]=$line
done < "$file"

# Filter the array line by line
for i in "${!my_array[@]}"; do
  if [[ ! ${my_array[i]} =~ ^[0-9] ]]; then
    echo "Line $i does not begin with a number: ${my_array[i]}"
  elif [[ ${my_array[i]} =~ ^[0-9] ]]; then
    echo "Line $i begins with a number: ${my_array[i]}"
  fi
done
