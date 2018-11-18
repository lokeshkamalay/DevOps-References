#!/bin/sh
#comment
#Numeric variables
echo "-----Numeric Variables-----"
a=10
b=20
c=$b
echo "A is $a, B is $b, C is $c"

#String Variables
echo -e "\n-----String Variables-----"
str_var="Loki"
echo "$str_var"
echo '$str_var'

#Operations
echo -e "\n-----Operators-----"
var1=100
var2=200
var3=$var1+$var2
var4=$((var1+var2))
var5=`expr $var1 + $var2`
echo "Variable 1: $var1"
echo "Variable 2: $var2"
echo "Variable 3 [\$var1+\$var2]: $var3"
echo "Variable 4 [\$((var1+var2))]: $var4"
echo "Variable 5 [\`expr \$var1 + \$var2\`]: $var5"

echo -e "\n-----More Operators-----"
echo "Addition: $((var1+var2))"
echo "Substract: $((var1-var2))"
echo "Multiplication: $((var1*var2))"
echo "Division: $((var2/var1))"
echo "Exponential: $((var1**var2))"
echo "Modulus: $((var2%var1))"

#Another way of using operators
echo -e "\n-----Another way of using operators-----"
echo "Variable1 is: $var1"
let var1+=900 #adding 900 to variable
echo "Variable1 value after using [let var1+=900]: $var1"
$((var1++)) # Increamenting by one
echo "Variable1 value after using [\$((var1++))] : $var1"

#Assigning command output to a variable
echo -e "\n-----Assigning output to a variable-----"
var6=$(hostname) #hostname is a shell command
var7=`ls | wc -l`
echo "My machine's hostname is: $var6"
echo "No.Of files in current directory: $var7"

#Getting the memory details
echo -e "\n-----Find the memory usage-----"
var8_total=$(free -h | awk '{print $2}' | head -2 | tail -1)
var9_used=$(free -h | awk '{print $3}' | head -2 | tail -1)
echo "Memory Details.  Total: $var8_total.  Used: $var9_used"

