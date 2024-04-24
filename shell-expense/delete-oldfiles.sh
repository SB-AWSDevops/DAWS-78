#!/bin/bash

src=/tmp/logs

if [ -d $src ]
 then
   echo "src exists - you can proceed further"
else
   echo "src not exists!! pls check"
   exit 4
fi

files=find $src -name "*.log" -mtime +14

echo "files more than 14 days old are: $files"
