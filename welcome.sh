#!/bin/bash
# this script prints out my welcome message
#the message looks like Welcome to planet hostname, title name!
#                   today is weekday

myhostname=`hostname`
mytitle="mister"
myname="nathan"
weekday=$(date +%A)

echo "Welcome to planet $myhostname,$mytitle $myname!"
echo "Today is $weekday."