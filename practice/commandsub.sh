#!/bin/bash

# lists the files and uses wc to count the lines.
read -p "Give path to directory: " dir
echo "There are $(ls ${dir} | wc -l) files in the ${dir} directory"
