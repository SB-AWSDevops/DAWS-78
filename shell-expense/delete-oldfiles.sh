#!/bin/bash

set -e 

src=/tmp/logs

if [ -d $src ]
 then
   echo "src exists"
else
   echo "src not exists!! pls check"
   exit 4
fi

files=$(find $src -name "*.log" -mtime +14)

echo "files more than 14 days old are: $files"

# for i in $files 
# do
# filename=$(echo $i | cut -d "/" -f4)
# echo "filenames are : $filename"
# rm "$i"
# echo "$filename deleted"
# done



while IFS= read -r line
do 
echo "deleting file - $line"
rm -rf $line
done <<< $files

