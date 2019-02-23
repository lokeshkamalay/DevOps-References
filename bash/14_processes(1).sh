#!/bin/sh
ps="$(ps -eaf | grep -i $1 | wc -l)"
if [[ $ps -le 4 ]];then
	echo "The process $1 is not running....Startig it!"
	sudo systemctl start $1
	if [[ $? -eq 0 ]];then
		echo "$1 Started successfully"
	else
		echo "$1 Failed to start.. Pls restart it manually"
	fi
else
	echo "$1 is already running"
fi
