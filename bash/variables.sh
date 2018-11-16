#!/bin/sh
#comment
#variables
a=10
b=20
c=$b
echo "A is $a, B is $b, C is $c"

#print the statements
cat <<END
This is a sample
cat test
END

#Variable expressions
d=$a+$b
echo "D is $d"
e=$((a+b))
echo "E is $e"

f=`expr $a + $b`
echo "Expression: $f"

#operators
echo "Addition: $((a+b))"
echo "Substract: $((b-a))"
echo "Multiplication: $((a*b))"
echo "Division: $((a*b))"
echo "Exponential: $((a**b))"
echo "Modulus: $((b%a))"
