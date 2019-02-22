#!/bin/sh
clear
number=$1
i=1
while [ $i -le $number ]; do
	j=1
	while [ $j -le $i ]; do
		echo -n "* "
		let j+=1
	done
	echo ""
	let i+=1
done
echo "---------------------------------------------"
i=1
while [[ $i -le $number ]]; do
	j=$i
	while [[ $j -le $number ]]; do
		echo -n "* "
		let j+=1
        done
echo ""
let i+=1
done
