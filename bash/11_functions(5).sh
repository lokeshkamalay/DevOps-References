#!/bin/sh
#Creating our own replacement to expr function
clear
loki() {
	var1=$1
	var2=$2
	var3=$3
	if [[ $var2 == "+" ]];then
		echo "$((var1 + var3))"
	fi

	if [[ $var2 == "-" ]]; then
		echo "$((var1 - var3))"
	fi
}
sub=$(loki 20 - 10)
echo $sub

sub=`expr 20 - 10`
echo $sub
