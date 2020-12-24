#!/bin/bash

echo $$ > .pid
mode="add"
res=1

usr1(){
	mode="add"
}

usr2(){
	mode="mult"
}

sigterm(){
	echo "Killed using SIGTERM"
	exit 0
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'sigterm' SIGTERM	

while true
do
	case $mode in
		add)
			let res=$res+2
		;;
		
		mult)
			let res=$res\*2
		;;
	esac
	echo $res
	sleep 1
done