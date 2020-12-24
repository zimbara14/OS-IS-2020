#!/bin/bash

res=1
mode="add"
(tail -f pipe1) |
while true
do
	read line
	if [[ $line == "QUIT" ]]; then
		echo "Stopping handler..."
		pkill tail
		pkill generator_1.sh
		exit 0
	elif [[ $line == '+' ]]; then
		mode="add"
	elif [[ $line == 'mult' ]]; then
		mode="mult"
	elif [[ $line =~ ^[0-9]+$ ]]; then
		case $mode in
			add)
				let res=$res+$line
			;;
			mult)
				let res=$res\*$line
			;;
		esac
		echo $res
	else
		echo "Invalid string"
		pkill tail
		pkill generator_1.sh
		exit 1
	fi
done