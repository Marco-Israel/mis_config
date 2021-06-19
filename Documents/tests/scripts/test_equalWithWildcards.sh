#!/bin/bash

#Test EQUAl of two strings
if [ $1 = "sda" ]
then
    echo "true 1"
else
    echo "false 1"
fi

if [ $1 == "sda" ]
then
    echo "true 2"
else
    echo "false 2"
fi

# Only for real numbers
#if [ $1 -eq "sda" ]
#then
#    echo true
#else
#    echo false
#fi
#


#Extends a string
if [ $1 == "sd"? ]
then
    echo "true 3"
else
    echo "false 3"
fi

if [[ $1 == "sd"? ]]
then
    echo "true 4"
else
    echo "false 4"
fi


if [[ $1 = "sd"? ]]
then
    echo "true 5"
else
    echo "false 5"
fi

if [[ $1 == "sd"? ]]
then
    echo "true 6"
    DRIVE=$1
    DRIVE="/dev/$1"
    echo "$DRIVE"
else
    echo "false 6"
fi


#Results in FALS and produces an error
if [ [ $1 == "sd"? ] ]
then
    echo "true 7"
else
    echo "false 7"
fi
