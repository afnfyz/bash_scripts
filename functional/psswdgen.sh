#!/bin/bash

read -p "Password Length: " length
if ! echo "${length}" | grep -q "^[0-9]\+$"
then
echo "Please enter a numberical value"
fi
chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+"

psswd=""
for i in $(seq 1 ${length})
do
    psswd=${psswd}${chars:RANDOM%${#chars}:1}
((i++))
done

echo "Password: ${psswd}"
