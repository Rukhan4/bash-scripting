#!usr/bin/env bash

#Read user input
#WEAPON="$1"
read -p "What is your weapon of choice? " WEAPON
#Chosen weapon 

case $WEAPON in
    sword)
    echo "The Pen is mightier than the Sword"
    ;;
    shield)
    echo "Really? A shield?"
    ;;
    spear)
    echo "A wise choice for close ranged combat"
    ;;
    bow)
    echo "Now that is a weapon"
    ;;
    *)
    echo "Are you a bare knuckle brawler?"
    ;;
esac