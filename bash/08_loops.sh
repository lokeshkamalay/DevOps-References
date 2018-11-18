#!/bin/sh
clear
read -p "Pls enter a random number:" number
echo -e "\n-----Printing Even Numbers-----"
for (( i=1; i<=$number; i=i+1 )); do
	if [[ $i%2 -eq 0 ]]; then
		echo -n "$i "
	fi
done	
echo -e "\n\n-----Printing Odd Numbers-----"
for (( i=0; i<=$number; i=i+1 )); do
	if [[ $i%2 -ne 0 ]]; then
		echo -n "$i "
	fi
done	
echo ""
