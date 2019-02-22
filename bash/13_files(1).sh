#!/bin/sh
clear
read -p "Provide the filename that you want to read: " file
read -p "Provide the string to check: " str
j=1
cat $file | while read i; do
	echo $i | grep -i $str > /dev/null 2>&1
	if [[ $? -eq 0 ]]; then
		echo "$str string is in $j line in $file"
	fi
	let j+=1
done
