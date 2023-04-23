#!/bin/bash

# function to execute when CTRL+C is pressed

function ctrl_c() {
    echo "CTRL+C pressed, exiting..."
    exit 1
}

# set up trap to catch CTRL+C signal
trap ctrl_c INT TERM

# infinite loop
while true; do
    echo "Press CTRL+C to exit"
    sleep 1
done

