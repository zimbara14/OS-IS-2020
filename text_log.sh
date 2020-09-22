#!/bin/bash
find /var/log/anaconda -type f -iname "X.log" > newfile
#sed 's/warn/\033[33mWarning:\e[0m/g' | sed 's/info/\033[34mInformation:\e[0m/g' <<< $file
echo "ye"
