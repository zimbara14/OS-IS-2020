#!/bin/bash

count=0
arr=()

echo " " > $HOME/lab5/report2.log

newF="$HOME/lab5/report2.log"

while true
do
	arr+=(1 2 3 4 5)
	count=$(($count+1))
	if [[ $count == 100000 ]]
	then
		count=0
		echo ${#arr[@]} >> $newF
	fi
done
