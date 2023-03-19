#!/bin/bash

read -p "Before: " string
echo -n "After: "
echo "$string" | tr '[:lower:]' '[:upper:]'
