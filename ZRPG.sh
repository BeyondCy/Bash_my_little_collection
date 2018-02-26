#!/bin/bash
clear
#-----------------------------------------------------------------------------
# author: ZeroDot1 https://github.com/ZeroDot1
# version: 1.1
# date time: 26.02.2018 21:15
#-----------------------------------------------------------------------------
echo -e "\033[1;32m""[ZRPG] ZeroDots Random Password Generator" | tee -a Passwords.txt
echo -e "\033[1;36m""_________________________________________" | tee -a Passwords.txt
while true; do 
	echo "#######################################_X" | tee -a Passwords.txt;
	echo " " | tee -a Passwords.txt;
	current_date_time="`date +%d.%m.%Y_%H:%M:%S`";
	echo "Password generated: "$current_date_time | tee -a Passwords.txt;
	echo "-----------------------------------------" | tee -a Passwords.txt;
	tr -cd '[:alnum:]' < /dev/urandom | fold -w10 | head -n1 2>&1 | tee -a Passwords.txt;
	echo "-----------------------------------------" | tee -a Passwords.txt;
	echo "Done!____________________________________" | tee -a Passwords.txt;
    sleep 2
done