#!/bin/bash

case "$1" in
	calc)
	. ./text_calc.sh
	;;
	search)
	grep -ri "$3" "$2"
	echo "We are doing some stuff!!"
	;;
	reverse)
	. ./text_reverse.sh
	;;
	strlen)
	. ./text_string.sh
	;;
	log)
	. ./text_log.sh
	;;
	exit)
	if [[ ! "$2" =~ ^[+-]?[0-9]+$ ]]; then
		exit 1
	fi

	if [ -z "$2" ] 
	then
		exit 0
	else
		exit  "$2"
	fi
	;;
	help)
	echo "$(<help.txt)"
	;;
	interactive)
	. ./text_interactive.sh
	;;
	*)
	echo "Wrong input! Try running the program again, and pay attention next time."
	;;	
esac

exit 0
