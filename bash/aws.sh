#!/bin/sh

echo "Getting the instance id here"

InstanceID=$(aws ec2 describe-instances --filter Name=tag:Name,Values=sq.com --query Reservations[].Instances[].InstanceId | grep -vE '\[|\]' | awk -F'"' '{ print $2 }')

echo "Current status of the instance $InstanceID"
C_STATUS=$(aws ec2 describe-instances --instance-id $InstanceID --query Reservations[].Instances[].State[].Name | grep -vE '\[|\]' | awk -F'"' '{ print $2 }')

if [[ $C_STATUS == "running" ]]; then
        echo "The instance is running, stopping it now"
        aws ec2 stop-instances --instance-ids $InstanceID
        if [[ $? == 0 ]];then
                echo "Instance is stopped successfully"
        else
                echo "There seems to be a problem in stopping the instance, pls do it manually"
        fi
else
        echo "The machine is not in running status"
fi
