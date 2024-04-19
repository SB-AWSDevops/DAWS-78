#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
 then
   echo "you need superuser access to install!!"
   exit 4
fi

dnf install mysql -y

##to check installation is successful

if [ $? -ne 0 ]
 then 
   echo "installtion - failure!!"
   exit 5
fi
