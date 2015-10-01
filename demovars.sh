#!/bin/bash

# this script demonstrates special variables

echo 'my pid ($$) is' $$
echo 'my command ($0) was' `basename $0` 
echo 'i had ($#) ' $# 'things on my command line'
echo "they were: $@"
echo "the first word on the command line after the command line was: $1"
echo "the second word on the command line after the command line was: $2"
cd "$1"
echo "the change directory to $1 produced status $?"