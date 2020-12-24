#!/bin/bash

curr_date=$(date --rfc-3339=date)
last_bu=$(find "/home/user" -regex "^/home/user/BACKUP-[0-9]+-[0-9]+-[0-9]+$" -type d | tail -n 1)

if [ -n "$last_bu" ]; then
	bu_name=$(basename "$last_bu")
	last_date=${bu_name:7}
	diff=$(( ($(date -d "$curr_date" +%s) - $(date -d "$last_date" +%s)) / 86400 ))
	if [[ diff -le 7 ]]; then
		created=0
		backup="$last_bu"
	else
		backup="/home/user/BACKUP-$curr_data"
		mkdir "$backup"
		created=1
	fi
else
	backup="/home/user/BACKUP-$curr_date"
	mkdir "$backup"
	created=1
fi

if [[ "$created" == "1" ]]; then
	cp -r "/home/user/source/." "$backup/"
	printf "%s %s\n" $(basename "$backup") "$curr_date" > "/home/user/backup-report"
	for file in "$backup"/*; do
		printf "%s \n" $(basename "$file") >> "/home/user/backup-report"
	done
else
	changed=0
	touch .new_files .updated_files
	for file in "/home/user/source"/*; do
		filename=$(basename "$file")
		if [ ! -z $(find "$backup" -name "$filename") ]; then
			sourcesize=$(wc -c < "$file")
			backupsize=$(wc -c < "$backup/$filename")
			if [ "$sourcesize" != "$backupsize" ]; then
				name=$(basename "$backup")
				date=${name:7}
				mv "$backup/$filename" "$backup/filename.$date"
				cp -r "$file" "$backup/"
				echo "$filename $filename.$date" >> .updated_files
				changed=1
			fi
		else
			cp -r "$file" "$backup/"
			echo "$filename" >> .new_files
			changed=1
		fi
	done
	if [[ "$changed" == "1" ]]; then
		printf "%s %s\n" $(basename "$backup") "$curr_date" >> "/home/user/backup-report"
		cat .new_files >> "/home/user/backup-report"
		cat .updated_files >> "/home/user/backup-report"
	fi
	rm .new_files .updated_files
fi	