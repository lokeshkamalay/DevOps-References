#!/bin/sh
echo "Number of arguments passed: $#"
echo "Installing the $1 software"
sudo yum -y install $1
if [[ $? -eq 0 ]]; then
	echo "The Software is installed successfully!"
else
	echo "Failed to install $1"
fi

