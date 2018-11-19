#!/bin/sh
clear
i=0
while [ $i -lt 10 ]; do
	if [ -e abc.txt ]; then
		#sudo systemctl start httpd
		echo "File is arrived, I'm starting the process"
		break
	elif [[ $i == 9 ]]; then
		echo "File doesn't arrive within said time.  Exiting!"
		exit
	else
		echo "waiting for the file...."
	fi
	sleep 1
	let i+=1
done
