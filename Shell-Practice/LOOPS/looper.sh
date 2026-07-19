#!/bin/bash

for i in { 1..5 }
do
	echo "round $i"
done

for file in *.sh
do
	echo "Found: $file"
done
