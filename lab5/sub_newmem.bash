#!/bin/bash

n=31000000
let n="$n"/15

echo "$n"

for(( i = 0; i < 30; ++i ))
do
	./newmem.bash "$n" &
	sleep 1
done 
