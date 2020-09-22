#!/bin/bash
ffile="/var/log/anaconda/X.log"

if [[ ! -f $ffile ]]; then
	echo "Error, tried to open non-existing file. Try again!"
	exit 1
fi

#	cat $ffile | grep "(WW)" | grep -v "warning " | sed 's/WW/\033[33mWarning:\e[0m/g'
#	cat $ffile | sed 's/info/\033[34mInformation:\e[0m/g'

echo "This was log"
warning=$(cat $ffile | sed 's/WW/\e[33mWarning:\e[0m/g')
info=$(cat $ffile | sed 's/II/\e[34mInformation:\e[0m/g')

echo -e "${warning}"
echo -e "${info}"


