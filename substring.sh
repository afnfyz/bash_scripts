#!/bin/bash

echo "Input file name: "
read filename
if [ -f "${filename}" ]; then
    extension="${filename##*.}"
    echo "Input old string: "
    read oldstring
else
    echo "ERROR: File not found."
    exit 1
fi

#Checks if the string is in the file using grep, -q is used so grep doesn't have output
 if grep -q "$oldstring" "$filename"; then
    echo "Input new string: "
    read newstring
    sed "s/${oldstring}/${newstring}/g" "${filename}" > ./files/"${filename%.*}_new.${extension}"
    echo ""
    echo "New File: "${filename%.*}_new.${extension}""
    echo ""
    cat ./files/"${filename%.*}_new.${extension}"
else
    echo "ERROR: String not found in file."
    exit 1
fi


#echo "Input new string: "
#read newstring
#sed "s/${oldstring}/${newstring}/g" "${filename}" > "${filename%.*}_new.${extension}"
#cat "${filename%.*}_new.${extension}"


