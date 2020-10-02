#!/bin/bash

#text1=$2
#text2=$3

if  [[ -z "$2" ]] || [[ -z "$3" ]]; then
	echo "Insufficent arguments provided! Terminating..."
	exit 1
fi

if ! [[ -e $2 ]]; then
	echo "File does not exist! Terminating..."
	exit 2
fi

if ! [[ -r $2 ]]; then
	echo "File '$2' cannot be read! Terminating..."
	exit 2
fi

if ! [[ -s $2 ]]; then
	echo "File '$2' is empty! Terminating..."
	exit 2
fi
	
if [[ -d $2 || -d $3 ]]; then
	echo "Directory! Terminating..."
	exit 3
fi

if [[ -e $3 ]]; then 
	if [[ -w $3 ]]; then
		if [[ "$3" == "$2" ]]; then
			echo "Self-reverse activated."
			rev $2 | tac >tempor
			mv tempor "$3"
		else
			rev $2 | tac >$3
			#echo "Self-reverse activated."
			#var=$(tac $2)
			#echo $var > $2 | 2>/dev/null
			#exit 0
		fi
	else
		echo "Permission to write: denied! Terminating..."
		exit 4
	fi
else
	if ! touch "$3" 2>/dev/null; then
		echo "Permission to create file: denied! Terminating..."
		exit 4
	else
		touch "$3"
		rev $2 | tac >$3
	fi
fi

#	tac $2 > $3 | 2>/dev/null


exit 0
