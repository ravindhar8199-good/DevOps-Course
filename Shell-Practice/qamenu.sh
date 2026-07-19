#!/bin/bash

echo "Hey QA engineer/analyst what you are going to perform today?"

read -p "Chose your Choise: " Choise

case $Choise in
	1) echo "Running smoke test:"; date ;;
	2) echo "list of .sh files in this folder are: $( ls *.sh | wc -l)" ;;
	3) echo "the currunt use and the folder are: $USER in $PWD" ;; # I was trying to print USER and pwd(commant) like ls kind of
	4) echo "goodbye" ;;
	*) echo "ivalid option " ;;
esac
		
		
