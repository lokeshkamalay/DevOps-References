#!/bin/sh
clear
getDate() {
	date
	return
}

getDate

addition() {
	a=$1
	b=$2
	add=$((a+b))
	echo $add
}
substraction() {
	a=$1
	b=$2
	echo "$((a-b))"
}
read -p "Enter a number:" num1
read -p "Enter another number:" num2
sum=$(addition num1 num2)
echo "Addition: $sum"
minus=$(substraction num1 num2)
echo "Substraction: $minus"
#multiplication
#division

