#!/bin/bash

case "$1" in
	calc)
	. ./text_calc.sh
	;;
	search)
	. ./text_search.sh
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
	. ./text_exit.sh
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
