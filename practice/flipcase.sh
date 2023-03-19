#!/bin/bash

read -p "Enter a string: " string
new_string=$(echo "$string" | tr '[:lower:][:upper:]' '[:upper:][:lower:]')
echo -n "Output: "
echo "${new_string}"

