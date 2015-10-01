#!/bin/bash

if [ "$1" = "-h" ]; then
    echo "you gave me the -h option"
    helpmode=1 
fi

while ("$1" != "" ) ; do
    case $1 in 
        -h | --help)
            echo "you gave me the -h option"
            echo "usage: `basename $0` [-h|--help] [-d|--debugmode]"
            ;;
        -d | --debugmode)
            echo "you gave me the -d option, setting debug mode"
            debug=1 
            ;;
        *)
            echo "i don't recognize $1, sorry about your luck, chuck"
            exit 1;
            ;;
    esac
    shift
done    