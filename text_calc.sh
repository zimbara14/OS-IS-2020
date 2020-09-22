#!/bin/bash

first=$3
second=$4

if [[ -z $first ]] 2>/dev/null; then
	echo "Enter two integers!"
	exit 1
fi

if [[ -z $second ]] 2>/dev/null; then
	echo "Enter another argument."
	exit 1
fi

if [[ ! "$first" =~ ^[\+|-]?[0-9]+$ ]]; then
	echo "Try again! The first argument is not an integer."
	exit 2>/dev/null
fi

if [[ ! "$second" =~ ^[+-]?[0-9]+$ ]]; then
	echo "Try again! The second argument is not an integer."
	exit | 2>/dev/null
fi

if [[ "$first" = "+0" || "$first" = "-0" ]]; then
	$first = 0 | 2>/dev/null
fi

if [[ "$second" = "+0" || "$second" = "+0" ]]; then
	$second = 0 | 2>/dev/null
fi

case "$2" in
	sum)
		sum=$(($expr ($first + $second) )) 
		echo "$sum" 2>/dev/null
		;;
	sub)
		sub=$(($expr $first - $second ))
		echo "$sub"
		;;
	mul)
		mul=$(($expr $first * $second ))
		echo "$mul"
		;;
	div)
	#	if [ $4 -eq 0 ]
	#	then
	#	echo "Can't divide by 0! Try all over again!"
	#	fi
		if [ "$second" == "0" ]; then
			echo "Can't divide by 0!"
			exit 1
		else
			div=$(($expr $first / $second ))
			echo "$div" 2>/dev/null
		fi
		;;
	*)
		echo "Wrong input! Try sum/sub/mul/div"
		;;
esac
exit 0
