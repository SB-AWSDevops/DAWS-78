#!/bin/bash

userid=$(id -u)

# validation for installation
validate()
{
if [ $1 -ne 0 ]
 then 
   echo "$2 FAILURE..please check!!"
 else
   echo "$2 SUCCESS.."
fi
}

dnf install mysql -y

validate "$?" "Install.."

dnf install git -y

validate "$?" "Install.."
