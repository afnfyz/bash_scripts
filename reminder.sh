#!/bin/bash

: '
......................................
# Documentation:

 This script allows you to set a reminder that will display onto the terminal.
 It uses the at command to do so.
 the format that can be used to set the time is as follows:

- YYMMDDhhmm[.ss]:   Specify an abbreviated year, month, day, hour, minute, and optionally seconds.
- CCYYMMDDhhmm[.ss]: Specify a full year, month, day, hour, minute, and optionally seconds.
- now:		     Indicates the current day and time and immediate execution.
- midnight:	     Indicates 00:00 AM.
- noon: 	     Indicating 12:00 PM.
- teatime: 	     Interpreted as 4 PM.
- AM: 		     Indicates time before 12:00 PM.
- PM: 		     Indicates time after 12:00 PM.
- today: 	     The current day.
- tomorrow: 	     The day after the current day.

# One can also specify relative time using by stating:
 now +
 x minutes
 x hours
 x days
 x weeks
 x months
 x years
- substituting x with the desired integer. e.g (now +5 minutes) -

 #Edit at jobs:
 - To view at jobs one can use the atq command.
 - To remove specific jobs one can use the atrm command while specifying the job number. 
 - To remove all at command jobs one can use the atrm command with the -a option.
 - To reset at command job counter one can delete the /var/at/atjobs file.

......................................
'
script_dir=$(dirname $0)

# Display welcome message.
# cat ./ascii/clock.txt

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
echo ""
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

at -M $datetime << EOF
echo "Reminder Message: ${msg}" > "reminder.txt"
echo "\n" >  $(tty) # Thanks Ali :) !
cat "script_dir/reminder.txt"  > $(tty)

cat  "${script_dir}/reminder.txt"
kill -2  $(pidof bash) # Sends CTRL+C signal.
EOF
