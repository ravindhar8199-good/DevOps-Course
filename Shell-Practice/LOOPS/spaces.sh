#!/bin/bash

for file in *.sh;
do
	#echo "total number of lines in $file has $( ls *.sh | wc -l)"
	echo "$file has $(wc -l < $file) lines"
done

