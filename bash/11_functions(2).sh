#!/bin/sh

if [[ -e abc.txt ]]; then
	echo "File abc.txt exists"
else
	touch abc.txt
fi

if [[ -e lmn.txt ]]; then
	echo "File lmn.txt exists"
else
	touch lmn.txt
fi

check_file() {
	fname=$1
	if [[ -e $fname ]]; then
		echo "File $fname exists"
	else
		touch $fname
	fi
	return
}

check_file abc.txt
check_file xyz.txt
