#!/bin/bash

#check if arguments provided

if [ $# -ne 2 ]
 then 
  echo "please provide src and destination folder properly!!"
  exit 1
fi

#check if src and dest folders exists

if [ ! -d $1 ]
 then 
  echo "src directory doesnot exists!!"
 exit 1
fi

if [ ! -d $2 ]
 then 
  echo "dest directory not exists!!"
  exit 3
fi

#create time stamp
timestamp=$(date +"%Y-%m-%d_%H:%M:%S")

#create archive filename with timestamp
archive_name="$(basename "$1")_${timestamp}.tar.gz"

#logic for compressing src directory 
tar -czf "$2/$archive_name" 

echo "backup created : $2/$archive_name"
