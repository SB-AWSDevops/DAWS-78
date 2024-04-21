#!/bin/bash

#this script is to automate database setup for expense project

#declaring useful variables
userid=$(id -u)
timestamp=$(date +%F..%H:%M:%S)
scriptname=$(echo $0)
logfile=/tmp/$scriptname:::$timestamp.log


#declaring color codes
R="\e[31m"
Y="\e[33m"
G="\e[32m"
N="\e[0m"
Bold="\e[1m"

#checking super user access

if [ $userid -ne 0 ]
 then 
   echo -e "$Y you need super user access!! $N"
   exit 3
fi

#asking user for db password
echo "Enter the db password: "
read -s dbpwd #use pwd as - ExpenseApp@1

#validation installation

validate(){

if [ $1 -ne 0 ]
 then 
   echo -e "$2..$R FAILURE!! $N"
 else
   echo -e "$2..$G SUCCESS!! $N"
fi

}

dnf install mysql-server -y &>>$logfile
validate $? "Install - mysql-server"

systemctl enable mysqld &>>$logfile
validate $? "enabling mysqld"

systemctl start mysqld &>>$logfile
validate $? "starting mysqld"

mysql -h db.surisetty.online -uroot -p$dbpwd -e 'show databases;' &>>$logfile
if [ $? -ne 0 ]
 then
    mysql_secure_installation --set-root-pass $dbpwd &>>$logfile
    validate $? "setting up db password"
 else
   echo -e "db password already setup...$Y SKIPPING!!"
fi

# mysql_secure_installation --set-root-pass $dbpwd &>>$logfile
# validate $? "setting up db password"