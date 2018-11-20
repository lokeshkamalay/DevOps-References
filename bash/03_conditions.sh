#!/bin/sh
#Condition type 1
check_if_file_exists=$(ls | grep -i abc.txt | wc -l)
if ((check_if_file_exists == 0)); then
	echo "abc.txt file doesn't exists."
	read -p "Do you want me to create one(y/n)?: " input
	if [[ $input == 'y' || $input == 'Y' ]]; then
		touch abc.txt
		echo "abc.txt file has been created successfully"
	fi
	exit
fi

#Condition type 2
[ -e abc.txt ] || echo "File doesn't exist."

echo -e "\nMoving curson to condition type 3\n"

#Condition type 3
if [ -e abc.txt ]; then
	read -p "Do you want to write something into the file(y/n): " input
	if [[ $input == 'y' || $input == 'Y' ]];then
		read -p "Pls enter what you want to write into the file: " msg
		echo $msg > abc.txt
		echo -e "\nFollowing message is entered into the file"
		cat abc.txt
	else
		echo "Thank You! Have a nice Day!"
	fi
fi


