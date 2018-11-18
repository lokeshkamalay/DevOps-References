#!/bin/sh
clear
read -p "Provide the filename that you want to read: " file
cat $file | while read i; do
	echo "$i"
done
