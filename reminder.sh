#!/bin/bash

# Display welcome message.
cat ./ascii/reminder.txt
echo ""

# Set msg variable from input.
read -p "Enter reminder message: " msg
echo ""
# Set time variable from input.
echo "Remind you in how long?"
echo "(e.g. 1 hour or 30 minutes or 1 year etc)"
read time

echo $time


