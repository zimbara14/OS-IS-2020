#!/bin/bash

if [[ $# == 0 ]]
then
	echo "arg not entered"
	exit 1
fi

arr=()
echo " " > $HOME/user/lab5/report.log

while true
do
	arr+=(1 2 3 4 5)
	if [[ "${#arr[@]}" -ge "$1" ]]; then
		echo ${#arr[@]} >> $HOME/lab5/temp
		break
	fi
done
