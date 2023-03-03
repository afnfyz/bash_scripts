#!/bin/bash

file="./files/lab5.txt"

# Have to first declare an empty array
my_array=()

# Then reads the file into the array
a=0
while read -r line; do
  my_array[a++]=$line
done < "$file"

# Filters the array line by line
# The ! allows to iterate over the indices of the array and echo both the index and value.
for i in "${!my_array[@]}"; do
  if [[ ${my_array[i]} =~ ^[^A-Za-z0-9_] ]]; then
    echo "Line starts with a non-word character: ${my_array[i]}"
  elif [[ ! ${my_array[i]} =~ ^[0-9] ]]; then
    echo "Line $i does not begin with a number: ${my_array[i]}"
  elif [[ ${my_array[i]} =~ ^[0-9] ]]; then
    echo "Line $i begins with a number: ${my_array[i]}"
 fi
done
