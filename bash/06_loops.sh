#!/bin/sh
clear
read -p "Pls enter a number between 1 to 10:" number
i=0
while [ $i -le $number ]; do
	echo "I'm in the loop $i"
	let i+=1
done
