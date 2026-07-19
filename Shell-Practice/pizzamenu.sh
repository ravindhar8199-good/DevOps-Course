#!/bin/bash

echo "press enter 1 for menu items"
echo "press enter 2 for deals"
echo "press enter 3 for frontdesk person"
echo "press enter 4 for close the call"

read -p "press number: " choice

case $choice in
	1) echo "Menu we have 3 types of sizes choose 1" ;;
	2) echo "deals we have large 2 toppings 7.99" ;;
	3) echo "FrontdeskPerson" ;;
	4) echo "Your call is ended" ;;
	*) echo "Invalid option" ;;
esac
