#!/bin/bash

pid=$(ps -eo pid,comm,time | awk '$2 == "loop" {print $0}' | sort -k 3 | tail -n 1 | awk '{print $1}')
echo $pid
while true
do
	pcpu=$(ps -eo pcpu,comm,time | awk '$2 == "loop" {print $0}' | sort -k 3 | tail -n 1 | awk '{print $1}')
	if [[ "$pcpu" =~ .{2,}\.* ]]; then
		echo "Killing first loop"
		kill -15 "$pid"
		break
	fi
done