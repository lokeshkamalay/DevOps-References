#!/bin/sh
clear
declare -a alphas=('ant' 'bat' 'cat' 'dog' 'eagle')
echo "${alphas}"
echo "${alphas[3]}"
echo "${alphas[@]}"
echo "${#alphas[@]}"
echo "${alphas[@]:1}"
echo "${#alphas[2]}"

mystr="cat"
j=0
for i in "${alphas[@]}"; do
	if [[ $i == $mystr ]]; then
		echo "found in $j the position"
	else
		let j+=1
	fi
done
