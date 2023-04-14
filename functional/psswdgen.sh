#!/bin/bash

read -p "Password Length: " length
if ! echo "${length}" | grep -q "^[0-9]\+$"
then
echo "Please enter a numberical value"
fi
chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+"

for i in $(seq 1 ${length})
do
    echo -n "${chars:RANDOM%${#chars}:1}"
done
