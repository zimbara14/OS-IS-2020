#!/bin/bash
ffile="/var/log/anaconda/X.log"

if [[ ! -f $ffile ]]; then
	echo "Error, tried to open non-existing file. Try again!"
	exit 1
fi

warning=$(cat $ffile | awk '/\[/ && /WW/') &>/dev/null
information=$(cat $ffile | awk '/\[/ && /II/') &>/dev/null

echo -e "${warning//"(WW)"/"\e[33mWarning:\e[0m"}"
echo -e "${information//"(II)"/"\e[34mInformation:\e[0m"}"
