#!/bin/sh
var1=$1
var2=$2
if [[ $# -eq 2 ]];then
	echo "Addition: $((var1 + var2))"
else
	echo "Insufficient arguments passed. Pls provide 2 arguments"
fi
