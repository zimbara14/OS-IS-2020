#!/bin/bash

while true
do
	ps -eo pid | sed -n '2,$p' > pipe2
done