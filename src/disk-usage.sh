#!/bin/bash

disk_usage=$(df -hT | grep xfs)
disk_threshold=5
message=""

while IFS= read -r line
do 
   usage=$(echo $line | awk -F " " '{print $6F}' | cut -d  "%" -f1)
   folder=$(echo $line | awk -F " " '{print $NF}')
   if [ $usage -ge $disk_threshold ]
    then
     message+="$folder is more than $disk_threshold, current usage is : $usage"
   fi
done <<< $disk_usage

echo -e "Message : $message"

echo "$message" | mail -s "Disk Usage Alert" surisetty08@gmail.com