#!/bin/sh
#loop for a file, send it to target, confirm the size.
fname="abc.txt"
target="10.10.10.10"
for ((i=1;i<= 30;i=i+1)); do
    if [[ -e /tmp/$fname ]]; then
        echo "File arrived....sending it over to target machine"
        scp "/tmp/$fname" "ec2-user@$target:/tmp/"
        status_check=$(ssh "ec2-user@$target" "ls /tmp | grep -i $fname | wc -l")
        target_size=$(ssh "ec2-user@$target" "du -sh /tmp/$fname")
        target_size=$(echo $target_size | awk '{print $1}')
        local_size=$(du -sh /tmp/$fname | awk '{print $1}')
        if [[ $local_size == $target_size ]]; then
            echo "File is Copied to remote server successfully"
            rm -rf /tmp/$fname
            exit
        else
            echo "It appears to be some issues with the file copy"
        fi
        exit 1
    fi
    if [[ i -eq 10 ]]; then
        echo "Writing something into the file" > $fname  #Creating the file
    fi
    if [[ i -eq 20 ]]; then
        echo "Sending notification to user about delay in the file"
    fi
    if [[ i -eq 30 ]]; then
        echo "File didn't arrive within stipulated time... Screaming!"   #Failing if file didn't arrive
        exit 1
    fi
    echo "$(date +'%Y%m%d %H%M%S') file didn't arrive yet..sleeping"   #giving a nap
    sleep 1
done
