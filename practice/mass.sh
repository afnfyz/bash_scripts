#!/bin/bash

: '
Author: Afnan
Date: 03/05/23
Description: 
'

#Convert csv file to tsv
#cat file.csv | sed 's/,/\t/g' > file.tsv

#file="./contacts.csv"

i=0
while IFS=, read -r name num mail; do
  name_array[i++]=$name
  number_array[i++]=$num
  email_array[i++]=$mail
done < ~/Downloads/contacts.csv

full=("${name_array[@]}" "${number_array[@]}" "${email_array[@]}")

for contacts in "${full[@]}"
do
echo ${contacts}
done

: '
for i in ${!name_array[@]} ${!number_array[@]} ${!email_array[@]}
do
echo ${name_array[i]}
echo ${number_array[i]}
((i++))
done

for contact in "${array[@]}"; do
  # Extract the name, phone, and email fields from the tab-separated line
  name=$(echo "$contact" | cut -f1)
  phone=$(echo "$contact" | cut -f2)
  email=$(echo "$contact" | cut -f3)

  echo "Name: $name"
  echo "Phone: $phone"
  echo "Email: $email"
  echo "---"
done
'
