#!/bin/bash -x
# this script creates an array 

colours=(red green blue)

declare -A animals
animals=([red]="cardinal" [green]="frog" [blue]="lobster")

echo "the colours array contains ${colours[0]}, ${colours[1]}, ${colours[2]}
echo "the array colours has the following content: ${colours[@]}
