#!/bin/bash

userid=$(id -u)

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

dnf install nginx -y

validate "$?" "NGINX" "Installation"

dnf install npm -y

validate "$?" "NPM" "Installation"
