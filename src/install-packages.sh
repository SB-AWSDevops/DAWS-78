##req - log redirections , and color codes mandatory

# script for installing the required packages 

# need sudo access, check whether its already installed or not ( dnf list installed <pack-name>), if already installed, 
#print as skipping and exit, if not , then take a loop and install all the packages

#!/bin/bash

userid=$(id -u)
timestamp=$(date +%F..%H:%M:%S)
scriptname=$(echo $0)
logfile=/tmp/$scriptname:::$timestamp.log

#color codes
R="\e[31m"
Y="\e[33m"
G="\e[32m"
N="\e[0m"
Bold="\e[1m"
#checking superuser access
if [ $userid -ne 0 ]
 then 
   echo -e "\e[32m You need super user access!!\e[0m"
   exit 3
fi

#validation of installtation
validate()
{
if [ $1 -ne 0 ]
 then 
  echo -e "$2..$R FAILURE!! $N"
 else
  echo -e "$2..$G SUCCESS!! $N"
fi
}

#install multiple packages through loop
for i in $@
 do
   echo -e "$bold package name - $i $N"
   dnf list installed $i &>>$logfile
   if [ $? -ne 1 ]
     then
       echo -e "$i already installed - \e[33mSKIPPING\e[0m"
    else
    dnf install $i -y &>>$logfile
    validate "$?" "Install $i"
   fi
done