#!/bin/bash

trashlog="/home/user/.trash.log"
trashdir="/home/user/.trash"

if [[ $(dirname "${1}") != "." ]]; then
	filename=$(basename "$1")
	echo ".untrash: given path $1 instead of raw name; possible fix: $filename"
	exit 1
fi

if [[ $# == 0 ]]; then
	echo "invalid symbol!"
	exit 1
fi

while IFS= read -r line
do
	IFS=" " read -ra ARR <<< "$line"
	filepath="${ARR[0]}"
	filename="${filepath##*/}"
	if [[ "$filename" == "$1" ]]; then
		read -e -p "Do you want to restore $filepath? (y/n): " ans < /dev/tty
		if [[ "$ans" == "y" ]]; then
			if [ ! -d $(dirname "${filepath}") ]; then
				echo "No directory path found. File will be restored to /home/user"
				path="/home/user"
			else
				path=$(dirname "${filepath}")
			fi
			while [ -f "$path/$filename" ]; do
				printf "$path/$filename already exists! Change the file name: "
				read filename < /dev/tty
			done
			ln "$trashdir/${ARR[1]}" "$path/$filename"
			rm "$trashdir/${ARR[1]}"
			echo "$path/$filename restored successfully!"
			break;
		fi
	fi
done < "$trashlog"

