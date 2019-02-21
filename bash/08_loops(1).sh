#!/bin/sh
clear
read -p "Enter a number:" num
odds=""
evens=""
for(( i=1; i<=$num; i=i+1)); do
	if [[ $i%2 -eq 0 ]]; then
		evens="$evens $i"	
	else
		odds="$odds $i"
	fi
done
echo "Even Numbers are: $evens"
echo "Odd Numbers are: $odds"
