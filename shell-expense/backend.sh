#!/bin/bash

#this script is to automate backend setup for expense project

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

dnf module disable nodejs -y &>>$logfile
validate $? "diabling node js current version"

dnf module enable nodejs:20 -y &>>$logfile
validate $? "enabling node js 20th version"

dnf install nodejs -y &>>$logfile
validate $? "Installing NodeJS"

id expense &>>$logfile
if [ $? -ne 0 ]
then
    useradd expense &>>$logfile
    VALIDATE $? "Creating expense user"
else
    echo -e "Expense user already created...$Y SKIPPING $N"
fi

mkdir -p /app &>>$logfile
validate $? "app directory created"

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>$logfile
validate $? "downloading the backend code"

cd /app
rm -rf /app/*
unzip /tmp/backend.zip &>>$logfile
validate $? "unzipping the backend code"

npm install &>>$logfile
validate $? "Installing NPM"

cp home/ec2-user/shell-expense/backend.service /etc/systemd/system/backend.service &>>$logfile
validate $? "Setup SystemD Expense Backend Service"

systemctl daemon-reload &>>$logfile
validate $? "loading the service"

systemctl start backend &>>$logfile
validate $? "starting the service"

systemctl enable backend &>>$logfile
validate $? "enabling the service"

dnf install mysql -y &>>$logfile
validate $? "Installing MYSQL"

mysql -h db.surisetty.online -uroot -p${dbpwd} < /app/schema/backend.sql &>>$logfile
validate $? "Loading the schema to the dadtabase"

systemctl restart backend
validate $? "restarting backend"