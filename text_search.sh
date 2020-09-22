#!/bin/bash
if ! [[ -d $2 ]]; then
	echo "No such directory exists."
fi

if [[ -z "$2" ]]; then
	echo "Insufficient arguments provided!"
	exit 0
fi 

grep -r $3 $2

