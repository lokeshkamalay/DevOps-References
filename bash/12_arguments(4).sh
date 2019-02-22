#!/bin/sh
if [[ $# -ne 1 ]];then
	echo "No or more arguments are passed, pls pass one argument only"
	exit
fi

clear
echo "Installing $1 software"
sudo yum install -y $1 > /dev/null 2>&1
if [[ $? -eq 0 ]];then
	echo "The software $1 is installed successfully"
else
	echo "Software installation is failed"
fi
