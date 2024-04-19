#!/bin/bash

# Define variables
src_dir=$(pwd)
backup_dir="$src_dir/backup"

# Debugging: Print the value of backup_dir
echo "Backup directory: $backup_dir"

# Debugging: Print the list of files in the source directory
echo "Files in source directory:"
ls -l "$src_dir"

# Check if backup directory exists, if not create it
if [ ! -d "$backup_dir" ]; then
    mkdir "$backup_dir"
    echo "Backup directory created."
fi

# Copy only files to backup directory and print their names
for file in "$src_dir"/*; do
    if [ -f "$file" ]; then
        if cp "$file" "$backup_dir"; then
            echo "Copied $(basename "$file") successfully"
        else
            echo "Failed to copy $(basename "$file")"
        fi
    fi
done

echo "backup completed successfully!!"