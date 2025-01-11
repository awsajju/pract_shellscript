#!/bin/bash

USERID=$(id -u)

Log_folder= /var/log/shell_pract.log
log_file=$(echo 0 | cut -d "%" -f1)
time_stamp=$(date +%Y-%m-%d-%H-%M-%S)
log_Name=$Log_folder/$log_file-$time_stamp
if [ $USERID -ne 0 ];then
    echo "you must have the root access to execute this"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ];then
        echo "$2 installing package failure"
        exit 1
    else
        echo "$2 installing package is success"
    fi
}

dnf list installed nodejs &>>$log_Name
if [ $? -ne 0 ]; then
    dnf install nodejs -y &>>$log_Name
    validate $1 "installing nodejs" 
else
    echo "alaredy nodejs is available"
fi