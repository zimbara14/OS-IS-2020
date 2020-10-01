
#!/bin/bash

if ! [[ $2 -ge 0  && $2 -le 255 ]]; then
	exit 1
fi
if [[ ! "$2" =~ ^[+-]?[0-9]+$ ]]; then
	exit 0
fi

if [ -z "$2" ]
then
	exit 0
else
	exit "$2"
fi


