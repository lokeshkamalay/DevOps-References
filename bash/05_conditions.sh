#!/bin/bash
clear
read -p "Enter a number A: " a
read -p "Enter a number B: " b
echo "Bigger number is $((a>b? $a : $b))"
