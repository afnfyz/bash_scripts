#!/bin/bash


script_dir=$(dirname $0)

# Display welcome message.
#cat ./ascii/clock.txt

cat << "EOF" 
       _..._
      |_____|
      |_____|
      |_____|
      |_____|
      |_____|
     / _____ \
     ||  '  ||
     ||  |  ||
     ||- | -||)
     ||   \ ||
     ||__.__||
     \_______/
      |_____|
      |_____|
      |_____|
      |_____|	         ____
       (   /_ /_   _  _   /
       |/|/(-(( ()//)(-  (()
	 ___  ___ _  _  _  _ _  __  ___ ___
	 ))_) )L  )\/,) )) )\`) ))\ )L  ))_)
	((`\ ((_ ((`(( (( ((`( ((_/((_ ((`\
EOF

# Check if which command finds the at command.
# The /dev/null removes the PATH output from the which command.
if ! which at > /dev/null; # The ! is the NOT logical operator which reverses the exit status of command.
	then
  echo ""
  echo "Error: at command not installed."
  echo "Please install or use crontab to set reminders"
  exit
fi

# Set msg variable from input.
read -p "Enter reminder message: " msg
echo ""

# Set time variable from input.
#echo "Remind you in how long?"
#echo "(e.g. 1 hour or 30 minutes or 1 hour + 30 minutes etc)"
#read time

# Set time variable from input.
echo "Enter when you would like to be reminded."
read datetime
echo ""

# Convert datetime to at format.
# The date command is used to convert the date and time into a different format.
# The -d option tells date to use the value of the $datetime variable as the input date and time
# The +"%m/%d/%Y %H:%M" option specifies the output format that the command should use.
#at_time=$(date -d "$datetime" +"%Y%m%d%H%M")

at $datetime << EOF
echo "Reminder Message: ${msg}" > "$script_dir/reminder.txt"
cat  "$script_dir/reminder.txt"
EOF
