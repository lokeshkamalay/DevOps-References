#!/bin/sh
clear
declare -a alphas=('ant' 'bat' 'cat' 'dog' 'eagle')

numbers[0]='a'
numbers[1]='1'
numbers[2]='22'
numbers[3]='333'
numbers[4]='4444'
numbers[5]='55555'
echo -e "Alphas Array: ${alphas[@]}\n"
echo -e "Numbers Array: ${numbers[@]}\n"

echo -e "Length of the Alphas array: ${#alphas[@]}\n"
echo -e "Length of the Numbers array: ${#numbers[@]}\n"
echo -e "3rd elements in the arrays: ${alphas[2]} and ${numbers[2]}\n"
echo -e "Printing from 2th position: ${alphas[@]:2:3}\n"
echo -e "Printing the length of last posision: ${#alphas[4]}\n"
echo -e "Finding and replacing bat with ball: ${alphas[@]/bat/ball}\n"
numbers=("${numbers[@]}" "666666" "7777777")
echo -e "Added two new positions in numbers: ${numbers[@]}\n"
unset numbers[0]
echo -e "Removed the first position as it contains alphabet: ${numbers[@]}\n"
unset numbers
echo -e "Removed the entire array numbers: ${numbers[@]}"
