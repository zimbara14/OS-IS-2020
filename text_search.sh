#!/bin/bash
if ! [[ -d $2 ]]; then
	echo "No such directory exists."
fi

grep -r $3 $2

