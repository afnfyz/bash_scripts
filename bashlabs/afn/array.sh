#!/bin/bash

i=0
while read -r line; do
  my_array[i++]=$line
done < ./files/lab5.txt

echo "${my_array[5]}"


# This checks if the line is empty by using -n option.
# Also echo -n wont skip to the next line but print on the same line.
i=0
while read -r line; do
  if [[ -n "$line" ]]; then
    my_array[i++]="$line"
  fi
done < myfile.txt

