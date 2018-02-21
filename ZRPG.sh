#!/bin/bash
clear
#-----------------------------------------------------------------------------
# author: ZeroDot1 https://github.com/ZeroDot1
# version: 1.1
# date time: 21.02.2018 16:03
#-----------------------------------------------------------------------------
echo -e "\033[1;32m""[ZRPG] ZeroDots Random Password Generator"
echo -e "\033[1;36m""_________________________________________"
while true; do 
	echo "#######################################_X";
	echo " ";
	current_date_time="`date +%d.%m.%Y_%H:%M:%S`";
	echo "Password generated: "$current_date_time;
	echo "-----------------------------------------";
	tr -cd '[:alnum:]' < /dev/urandom | fold -w10 | head -n1;
	echo "-----------------------------------------";
	echo "Done!____________________________________";
    sleep 2
done