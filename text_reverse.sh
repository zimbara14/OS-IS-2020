#!/bin/bash

#text1=$2
#text2=$3

if  [[ ! -z $2 ]] || [[ ! -z $3 ]]; then
	echo "Error! Insufficent arguments provided."
	exit 1
fi

if ! [[ -e $2 ]]; then
	echo "File does not exist! Terminating..."
	exit 1
fi

if [[ "$3" == "$2" ]]; then
	echo "Self-reverse activated."
	var=$(tac $2)
	echo $var > $2
	exit 0
else
	tac $2 > $3 | 2>/dev/null
	exit 0
fi





exit 0
