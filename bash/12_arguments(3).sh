#!/bin/sh
rm $1 2> /dev/null
if [[ $? -ne 0 ]];then
	echo "The command failed to delete the file"
else
	echo "The file $1 is deleted successfully"
fi
