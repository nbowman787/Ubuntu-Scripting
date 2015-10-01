#!/bin/bash
# this script asks the user for 2 numbers, then does the
#   5 basic arithmatic operations on those numbers

read -p " Enter a Number " firstnum
read -p " Enter a Second number " secondnum

total=$((firstnum + secondnum))
echo "$firstnum + $secondnum equals $total"
total=$((firstnum - secondnum))
echo "$firstnum - $secondnum equals $total"
total=$((firstnum * secondnum))
echo "$firstnum * $secondnum equals $total"
total=$((firstnum / secondnum))
echo "$firstnum / $secondnum equals $total"
remainder=$((firstnum % secondnum))
echo "$firstnum modulus $secondnum equals $remainder"