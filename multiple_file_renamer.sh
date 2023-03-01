#!/bin/bash

echo "Welcome to the file renamer!"
echo "This will rename all files by adding sequential numbers in the current directory"
echo "first sorting in ascending order based on the name of the file"
echo ""

read -p "Choose preferred name for files: " name
# Sort the files in the current directory by name
files=($(ls -1v))

counter=1

for file in "${files[@]}"; do
#this if function makes sures that the files in the list are files and not directories using the -f option
  if [ -f "$file" ] && [ "${file##*.}" != "sh" ] && [ "${file##*.}" != "md" ]; then 
    # Get the file extension
 extension="${file##*.}"
    # Generate the new filename with sequential numbering
 new_filename=$(printf "${name}%03d.%s" "$counter" "$extension")
    # Rename the file
    mv "$file" "$new_filename"
    # Increment the counter
 ((counter++))

  fi
done
