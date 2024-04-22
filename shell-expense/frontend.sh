#!/bin/bash

#this script is to automate frontend setup for expense project

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

#validation installation

validate(){

if [ $1 -ne 0 ]
 then 
   echo -e "$2..$R FAILURE!! $N"
 else
   echo -e "$2..$G SUCCESS!! $N"
fi

}

dnf install nginx -y &>>$logfile
validate $? "Installing Nginx"

systemctl enable nginx &>>$logfile
validate $? "Enabling Nginx"

systemctl start nginx &>>$logfile
validate $? "starting Nginx"

rm -rf /usr/share/nginx/html/* &>>$logfile
validate $? "Removing the default content that web server is serving."

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip &>>$logfile
validate $? "Downloading the frontend content"

cd /usr/share/nginx/html &>>$logfile
validate $? "Extracting the frontend content"

unzip /tmp/frontend.zip &>>$logfile
validate $? "Unzipping the frontend content"

cp /home/ec2-user/DAWS-78/shell-expense /etc/nginx/default.d/expense.conf &>>$logfile
validate $? "Creating and copying the Nginx Reverse Proxy Configuration" 

systemctl restart nginx
validate $? "Restarting the Nginx to load the changes of the configuration"