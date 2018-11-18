#!/bin/sh
echo -e "\n-----Read the variable from terminal-----"
read -p "Enter your age: " age
if [ $age -le 0 ]; then
	echo "Pls enter a valid number next time.  Exiting."
	exit
fi

if [[ $age -ge 60 ]]; then
	echo "You are a senior citizen!"
elif [ $age -ge 40 ]; then
	echo "You are in your 40s, take care of health"
elif [[ $age -ge 25 && $age -lt 40 ]]; then
	echo "Time to get married"
elif [[ $age -ge 19 ]]; then
	echo "You are Young Bro!"
elif ((age <= 19 && age > 12)); then
	echo "You are a teenager....have some fun :)"
elif [[ $age -le 12 ]]; then
	echo "You are a Kid"
else
	echo "Something has gone wrong"
fi

