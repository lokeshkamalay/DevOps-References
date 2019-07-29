#!/bin/sh

if [[ $# -ne 1 ]]; then
	echo "This script except instance id"
	exit 1
fi

echo "Current status of the instance $1"
C_STATUS=$(aws ec2 describe-instances --instance-id $1 --query Reservations[].Instances[].State[].Name | grep -vE '\[|\]' | awk -F'"' '{ print $2 }')

if [[ $C_STATUS == "running" ]]; then
	echo "The instance is running, stopping it now"
	aws ec2 stop-instances --instance-ids $1
        if [[ $? == 0 ]];then
		echo "Instance is stopped successfully"
	else
		echo "There seems to be a problem in stopping the instance, pls do it manually"
	fi
else
	echo "The machine is not in running status"
fi
