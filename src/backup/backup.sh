#!/bin/bash

#Prompt user for input

echo "Welcome to File Backup Script!!"
read -p "Enter the directory you want to backup: " src
read -p "Enter the dest directory you want to backup: " backup

#Validations for the src directory to check any loose files are there or not, if yes, we will copy to backup directory

if [ "$(ls -A .)" ]
 then
   cp * "$backup/"
   if [ $? -eq 0 ]
     then
       echo "files copied to backup folder succesfully!!"
   fi
elif [ ! -r $src ]
 then
   echo "ERROR : You dont have read permissions for this directory"
exit 6
fi

if [ ! -d $backup ]
 then
   echo "ERROR : DEST directory doesnot exists or it is not a directory"
exit 5
elif [ ! -w $sbackup ]
 then
   echo "ERROR : You dont have write permissions for this directory"
exit 6
fi

