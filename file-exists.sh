#!/bin/sh

# This script can help detect if the passed in file exists or not. 

if [ "$#" -eq 0 ]; then
	echo "\nThere are no arguments passing in." 
	exit 1
fi

filename="$1"

if [ -e "$filename" ]; then
	echo "$filename exists!"
else
	echo "$filename does not exists!" 
fi