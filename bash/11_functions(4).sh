#!/bin/sh

arithmetic() {
	var1=$1
	var2=$2
	result[0]=$((var1 + var2))
	result[1]=$((var1 - var2))
	result[2]=$((var1 * var2))
	result[3]=$((var1 / var2))
	result[4]=$((var1 % var2))
	echo ${result[@]}
}

declare -a res=($(arithmetic 10 20))
echo "Addition: ${res[0]}"
echo "Substraction: ${res[1]}"
echo "Multiplication: ${res[2]}"
echo "Division: ${res[3]}"
echo "Modulus: ${res[4]}"

declare -a res=($(arithmetic 200 10))
echo "Multiplication is ${res[2]}"
