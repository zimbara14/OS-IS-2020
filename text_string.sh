#!/bin/bash
mystring=$2
if [[ -z $mystring ]]; then
	echo "Error! Input some string..."
	exit 1
fi

echo "${#mystring}"

#var=$(printf '%s' $mystring) and echo ${#mystring}

exit 0;
