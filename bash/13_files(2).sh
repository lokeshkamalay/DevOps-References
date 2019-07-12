#!/bin/sh
clear
read -p "Enter the file name:" filename
read -p "Enter the String to look:" string

cat $filename | while read i;do
	echo $i | grep -i $string > /dev/null
	if [[ $? -eq 0 ]];then
		echo "The given string $string is found in the file"
	else
		echo "The given string $string is NOT found"
	fi
done

echo "Using logic here:"
echo "-----------------"
cat $filename | while read i;do
        echo $i | grep -i $string > /dev/null
        if [[ $? -eq 0 ]];then
                echo "The given string $string is found in the file"
		touch found.txt
        fi
done

if [[ -e found.txt ]];then
	rm -rf found.txt
else
	echo "The given string $string is NOT found in the file"
fi
