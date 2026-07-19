#!/bin/bash
read -p "Enter a number: " num
if [ $num -gt 100 ];then
	    echo "Big number"
    else
	        echo "Small number"
fi
echo "Your number was $num"
