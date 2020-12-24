#!/bin/bash

trash=.trash

if [ $# == 0 ]
then
	echo "error: no args entered"
	exit 1
fi

if [ $# > 1 ]
then
	echo "error: entered more than one arg"
	exit 1
fi

if [ ! -f "$1" ]
then
	echo "error: ./rmtrash : file $1 does not exist"
	exit 1
fi

if [ ! -d "/home/user/$trash" ]
then
	mkdir "/home/user/$trash"
fi

if [ "$(ls -A "/home/user/$trash")" ]
then
	namelink=$(ls -A "/home/user/$trash" | wc -l)
	let namelink="$namelink"+1
else
	namelink=1
fi

ln "$1" "/home/user/.trash/$namelink"
rm "$1"

printf "%s %s\n" "$PWD/$1" "$namelink" >> "/home/user/.trash.log"