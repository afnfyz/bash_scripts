#!/bin/bash


script_dir=$(dirname $0)

# Display welcome message.
cat ./ascii/clock.txt

# Check if which command finds the at command.
# The /dev/null removes the PATH output from the which command.
if ! which at > /dev/null; # The ! is the NOT logical operator which reverses the exit status of command.
	then
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

at -M $datetime << EOF
echo "Reminder Message: ${msg}" > "$script_dir/reminder.txt"
cat  "$script_dir/reminder.txt"
EOF
ubuntu@ip-172-31-31-238:~/bash_scripts$ atq
ubuntu@ip-172-31-31-238:~/bash_scripts$ atq
ubuntu@ip-172-31-31-238:~/bash_scripts$ ./reminder.sh 
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
                                    
Enter reminder message: testing

Enter when you would like to be reminded.
5:28pm

warning: commands will be executed using /bin/sh
job 8 at Fri Feb 24 17:28:00 2023
ubuntu@ip-172-31-31-238:~/bash_scripts$ ls
README.md  ascii  file_producer.sh  multiple_file_renamer.sh  reminder.sh
ubuntu@ip-172-31-31-238:~/bash_scripts$ nano reminder.sh 
ubuntu@ip-172-31-31-238:~/bash_scripts$ ls
README.md  ascii  file_producer.sh  multiple_file_renamer.sh  reminder.sh
ubuntu@ip-172-31-31-238:~/bash_scripts$ ls
README.md  ascii  file_producer.sh  multiple_file_renamer.sh  reminder.sh
ubuntu@ip-172-31-31-238:~/bash_scripts$ nano reminder.sh 
ubuntu@ip-172-31-31-238:~/bash_scripts$ ./reminder.sh 
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
                                    
Enter reminder message: hi 

Enter when you would like to be reminded.
5:34PM

warning: commands will be executed using /bin/sh
job 9 at Fri Feb 24 17:34:00 2023
ubuntu@ip-172-31-31-238:~/bash_scripts$ ls
README.md  ascii  file_producer.sh  multiple_file_renamer.sh  reminder.sh
ubuntu@ip-172-31-31-238:~/bash_scripts$ ls
README.md  ascii  file_producer.sh  multiple_file_renamer.sh  reminder.sh
ubuntu@ip-172-31-31-238:~/bash_scripts$ cd ascii/
ubuntu@ip-172-31-31-238:~/bash_scripts/ascii$ ls
reminder.txt
ubuntu@ip-172-31-31-238:~/bash_scripts/ascii$ cat reminder.txt 
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
                                    
ubuntu@ip-172-31-31-238:~/bash_scripts/ascii$ mv reminder.txt clock.txt
ubuntu@ip-172-31-31-238:~/bash_scripts/ascii$ ls
clock.txt
ubuntu@ip-172-31-31-238:~/bash_scripts/ascii$ cd ..
ubuntu@ip-172-31-31-238:~/bash_scripts$ nano reminder.sh 

  GNU nano 6.2                            reminder.sh *                                   

# Check if which command finds the at command.
# The /dev/null removes the PATH output from the which command.
if ! which at > /dev/null; # The ! is the NOT logical operator which reverses the exit st>
        then
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
# The -d option tells date to use the value of the $datetime variable as the input date a>
# The +"%m/%d/%Y %H:%M" option specifies the output format that the command should use.
#at_time=$(date -d "$datetime" +"%Y%m%d%H%M")

at -M $datetime << EOF
echo "Reminder Message: ${msg}" > "$script_dir/reminder.txt"
cat  "$script_dir/reminder.txt"
EOF

