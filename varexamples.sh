#!/bin/bash 
# this script creates an array 

#variables
colours=(red green blue)
declare -A animals
animals=([red]="cardinal" [green]="frog" [blue]="lobster")

#main

# num=0
endOfArray=$(( ${#colours} -1))
numberOfColours=${#colours}
read -p "pick a number [1- $numberOfColours]:" num
num=$(($num - 1))
# the end of the array is the number of elements in the array -1
# see if the number supplied by the user is valid for the colours array
# valid means between 0 and the end of the array
if [ $num -lt 0 ]; then
    echo "the smallest number you can pick is 1." >&2
    exit 2
elif [ $num -gt $endOfArray ]; then
        echo "the maximum number you can pick is $numberOfColours" >&2
        exit 2
fi

# display the colour and corresponding animal
colour=${colours[$num]}
echo "============"
echo "index $num of the colours table produces a $colour ${animals[$colour]}"
echo "==========="

#echo "the colours array contains ${colours[0]}, ${colours[1]}, ${colours[2]}"
#echo "the array colours has the following values: ${colours[@]}"

#echo "the animals array contains ${animals[red]}, ${animals[blue]}, ${animals[green]}"
#echo "the array colours has the following values: ${animals[@]}"
# display the colour array, no matter how much stuff it has in it
#for colour in "${colours[@]}"; do
#   echo "the colours array contains ${colours[colour]}"
#done

#for colour in "${colours[@]}"; do
 #   echo "the colours array contains the value $colour"
#done

#index=0
#for ((index=0;$index < ${#colours}; index++)); do
 #   echo "the colours array has the value ${colours[index]} at position $index"
#done