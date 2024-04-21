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
   echo -e "$2 $3 \e[43m\e[31mFAILURE..\e[47mYou need super user access..please check!!\e[0m" >&2
   exit 6
 else
   echo -e "$2 $3 \e[32mSUCCESS..\e[0m"
   echo -e "\e[1m\e[4mTO SEE LOG FILES, GOTO /tmp folder\e[0m]"
fi
}

dnf install nginx -y &>> $logfile

validate "$?" "NGINX" "Installation"

dnf install npm -y &>> $logfile

validate "$?" "NPM" "Installation"
