#!/bin/bash

last=$(find "/home/user" -regex "^/home/user/BACKUP-[0-9]+-[0-9]+-[0-9]+$" -type d | tail -n 1)
if [ ! -z  "$last" ]
then
    for f in $(ls "/home/user/$last"/* | grep -vP ".[0-9]{4}.[0-9]{2}.[0-9]{2}")
    do
        if [ ! -d "/home/user/restore" ]
        then
            mkdir "/home/user/restore"
        fi
        cp -r "$file" "/home/user/restore/"
    done
fi
