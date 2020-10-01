#!/bin/bash

#text1=$2
#text2=$3

if ! [[ -e $2 ]]; then
	echo "File does not exist! Terminating..."
	exit 1
fi

if ! [[ -e $3 ]]; then
	echo "Self-reverse activated."
	tac $2 | rev > $2
	exit 0
else
	tac $2 > $3 | 2>/dev/null
	exit 0
fi





exit 0
