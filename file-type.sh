#!/bin/sh

# This script can help detect what the file type is.  

if [ "$#" -eq 0 ]; then
	echo "\nThere are no arguments passing in.\n" 
	exit 1
fi

filename="$1"

if [ -e "$filename" ]; then
	if [ -f "$filename" ]; then
		echo "\nFile $filename is a regular file\n"
	elif [ -b "$filename" ]; then
		echo "\nFile $filename is a block file\n"
	elif [ -c "$filename" ]; then
		echo "\nFile $filename is a character file\n"
	elif [ -d "$filename" ]; then
		echo "\nFile $filename is a directory\n"	
	else 
		echo "\nI don't know what type of file that is.\n"
	fi

	fileType=$(file "$filename" | cut -d " " -f2)
	case $fileType in
		"ASCII")
			echo "\nFile $filename is a regular file\n"
		;;
		"POSIX")
			echo "\nFile $filename is a script file\n"	
		;;
		"character")
			echo "\nFile $filename is a character file\n"
		;;
		*)
			echo "\nI don't know what type of file($fileType) that is.\n"		
		;;
	esac

else
	echo "$filename does not exists!" 
fi