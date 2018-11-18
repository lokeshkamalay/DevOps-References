#!/bin/sh
clear
echo "-----This is an example of until loop-----"
i=1
until [ $i -ge 10 ]; do
	echo -n "$i "
	let i+=1
done

echo -e "\n\n\n-----This is an example of for loop range-----"
echo "Numbers in range"
for i in {1..10}; do
	echo -n "$i "
done

echo -e "\nAlphabets in range"
for i in {A..Z}; do
	echo -n "$i "
done
echo -e "\n"



