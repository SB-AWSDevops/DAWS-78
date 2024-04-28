#!/bin/bash

#check the providence of filepath to read the file

if [ $# -ne 1 ]
 then
   echo "please provide filename"
   exit 1
fi 

#check if file exists

if [ ! -f "$1" ]
 then 
   echo "file - $1 doesnot exists!!"
   exit 2
fi 

#count the occurences and first most 5 used

echo "Top 5 most used words in this txt file:"
cat $1 | grep -v '^\s*$' "$1" | tr -s '[:space:]' '\n' | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -rn | head -n 5
