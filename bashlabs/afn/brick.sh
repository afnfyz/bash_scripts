#!/bin/bash

read -p "Height: " h
for ((i=0; i<${h}; i++)); do
for ((j=0; j<${h}-i; j++));do
echo -n "#"
done
echo ""
done
