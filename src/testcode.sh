#!/bin/bash

# Define variables
src_dir=$(pwd)
backup_dir="$src_dir/backup"

# Check if backup directory exists, if not create it
if [ ! -d "$backup_dir" ]; then
    mkdir "$backup_dir"
fi

# Check if there are any files in the source directory
if [ "$(ls -A "$src_dir")" ]; then
    # Copy files to backup directory
    cp "$src_dir"/* "$backup_dir"
    echo "Files copied to backup directory."
else
    echo "No files found in the current directory."
fi
