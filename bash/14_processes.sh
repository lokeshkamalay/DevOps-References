#!/bin/sh
pid_count=$(ps -eaf | grep -i "httpd"| wc -l)
if [[ $pid_count -lt 2 ]]; then
	echo "Process is not running...so I'm starting the service"
	sudo systemctl start httpd
else
	echo "The Process is running fine"
fi
