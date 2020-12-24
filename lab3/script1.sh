#!/bin/bash

exec_time=$(date)

newDir=$HOME/test
report=~/report
host="www.net_nikogo.ru"
mess1="Catalog test successfully created"
mess2="Host $host unavailable"

mkdir "$newDir" && { echo "$mess1" >> "$report" ; touch "$newDir/$exec_time"; }
ping "$host" || printf "%s %s\n" "$(date)" "$mess2" >> "$report"