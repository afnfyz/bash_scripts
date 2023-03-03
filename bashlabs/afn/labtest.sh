#!/bin/bash

file="./files/lab5.txt"

# Declare an empty array

my_array=()

# Read the file into the array. This will include empty lines.

i=0
while read -r line; do
  my_array[i++]=$line
done < "$file"

# Filter through the array line by line.
# The @ symbol signifies that the loop should run through all indexes of the array.

for i in "${!my_array[@]}"; do
 
 # The "=~" operator tests if the variable "$string" matches the regular expression "pattern"
  if [[ ! ${my_array[i]} =~ ^[0-9] ]]; then
    echo "Line ${i} does not begin with a number: ${my_array[i]" >> ./files/lab5out.txt

  elif [[ ! ${my_array[i]} =~ ^[A-Z][a-z] ]]; then
     echo "Line ${i} does not begin with a letter: ${my_array[i]} " >> ./files/lab5out.txt
fi
done
