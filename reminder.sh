#!/bin/bash

# Display welcome message.
cat ./ascii/reminder.txt
echo ""

# Check for at command.
# The /dev/null removes the PATH output from the which command.
if which at > /dev/null;
	 then

# Set msg variable from input.
read -p "Enter reminder message: " msg
echo ""

# Set time variable from input.
echo "Remind you in how long?"
echo "(e.g. 1 hour or 30 minutes or 1 hour + 30 minutes etc)"
read time
	else
echo "at command not installed."
echo "Please install or use crontab to set reminders"

fi
at now + ${time}  

