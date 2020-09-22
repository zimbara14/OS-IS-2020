#!/bin/bash
ffile="/var/log/anaconda/X.log"

if [[ ! -f $ffile ]]; then
	echo "Error, tried to open non-existing file. Try again!"
	exit 1
fi

#	cat $ffile | sed 's/WW/\033[33mWarning:\e[0m/g'
#	cat $ffile | sed 's/II/\033[34mInformation:\e[0m/g'
