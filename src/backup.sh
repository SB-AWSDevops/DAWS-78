#!/bin/bash

# Define variables
src_dir=$(pwd)
backup_dir="$src_dir/backup"

#Prompt user for input

echo "Welcome to File Backup Script!!"


#Validations for the src directory to check any loose files are there or not, if yes, we will copy to backup directory

find "$src_dir" -maxdepth 1 -type f -exec cp -t "$backup_dir" {} \;

if [ ! -d $backup ]
 then
   echo "ERROR : DEST directory doesnot exists or it is not a directory"
exit 5
elif [ ! -w $sbackup ]
 then
   echo "ERROR : You dont have write permissions for this directory"
exit 6
fi

