#!/bin/bash

echo "Enter your age: "
read age

if [ $age -gt 18 ];then
	echo "Your are an adult"
elif [ $age -ge 13 ];then
	echo "You are  teenager"
else
	echo "you are still KID"
fi
