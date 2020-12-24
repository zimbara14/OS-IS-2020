#!/bin/bash

echo $$ > .pid

sigterm(){
	echo "Killed using SIGTERM"
	pkill tail
	exit 0
}

trap 'sigterm' SIGTERM
	
(tail -f pipe2) |
while true
do
	read pid
	printf "%s works and will soon go on vacation\n" $pid >> log
done
