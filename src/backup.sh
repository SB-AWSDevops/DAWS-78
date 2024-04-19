#!/bin/bash

# Define variables
src_dir=$(pwd)
backup_dir="$src_dir/backup"

#Prompt user for input

echo "Welcome to File Backup Script!!"


#Validations for the src directory to check any loose files are there or not, if yes, we will copy to backup directory



if [ ! -d $backup_dir ]
 then
   echo "ERROR : DEST directory doesnot exists or it is not a directory"
exit 5
elif [ ! -w $sbackup_dir ]
 then
   echo "ERROR : You dont have write permissions for this directory"
exit 6
fi

find "$src_dir" -maxdepth 1 -type f -exec cp -t "$backup_dir" {} \;
echo "copied files to backup foler successfullyy!!"

