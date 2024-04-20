#!/bin/bash

userid=$(id -u)
timestamp=$(date +%F..%H:%M:%S)
scriptname=$(echo $0)
logfile=/tmp/$scriptname-$timestamp.log

# validation for installation
validate()
{
if [ $1 -ne 0 ]
 then 
   echo "$2 $3 FAILURE..You need super user access..please check!!" >&2
   exit 6
 else
   echo "$2 $3 SUCCESS.."
fi
}

dnf install nginx -y >> $logfile

validate "$?" "NGINX" "Installation"

dnf install npm -y >> $logfile

validate "$?" "NPM" "Installation"
