#!/bin/bash


echo "this is chouse your choise"

read -p "Do you want to continue? (yes/no): " choise
case $choise in
	yes) echo "Great, continuing..." ;;
	no) echo "Okey, stopped." ;;
	*) echo "Please enter yes or no" ;;
esac
	
