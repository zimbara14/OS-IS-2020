#!/bin/bash

if [[ -z $2 ]] || [[ -z $3 ]]; then
	echo "Error: insufficient arguments provided!"
	exit 1
fi 

if ! [[ -e $2 ]] || ! [[ -d $2 ]]; then
	echo "Error: no such file or directory!"
	exit 1
fi

echo -e "\e[45mSearch results:\e[0m\n"
grep -r $3 $2 2>/dev/null
exit 0

