#!/bin/bash

#Prompt user for input

echo "Welcome to File Backup Script!!"
read -p "Enter the directory you want to backup: " src_dir
read -p "Enter the dest directory you want to backup: " dst_dir

echo "Source directory: $src_dir"  # Print source directory for debugging
echo "Destination directory: $dst_dir"  # Print destination directory for debugging

#Validations for the src and dest directories whether exists or not

if [ ! -d $src_dir ]
 then
   echo "ERROR : SRC directory doesnot exists or it is not a directory"
exit 5
elif [ ! -r $src_dir ]
 then
   echo "ERROR : You dont have read permissions for this directory"
exit 6
fi

if [ ! -d $dst_dir ]
 then
   echo "ERROR : DEST directory doesnot exists or it is not a directory"
exit 5
elif [ ! -w $src_dir ]
 then
   echo "ERROR : You dont have write permissions for this directory"
exit 6
fi

#Perform Backup

echo "Backup is in progress..."
cp -r "$src_dir" "$dst_dir"
echo "Backup process is completed!! Files copied to $dst_dir"