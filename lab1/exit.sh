
#!/bin/bash

if [[ ! "$2" =~ ^[+-]?[0-9]+$ ]]; then
	echo "NaN! Exiting with code 1..."
	exit 1
fi

if ! [[ $2 -ge 0  && $2 -le 255 ]]; then
	echo "Not in range. Exiting with code 1..."
	exit 1
fi

if [ -z "$2" ]
then
	exit 0
else
	exit "$2"
fi


