#!/bin/bash
mystring=$2

if [[ $# -gt 2 ]]; then
	echo "Error! Enter only one string."
	exit 2
fi

echo ${#mystring}

exit 0
