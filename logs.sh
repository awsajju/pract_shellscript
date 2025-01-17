#!/bin/bash

USERID=$(id -u)

Log_folder="/var/log/shell_pract.log"
log_file=$(echo 0 | cut -d "%" -f1)
time_stamp=$(date +%Y-%m-%d-%H-%M-%S)
log_Name="$Log_folder/$log_file-$time_stamp.log"
if [ $USERID -ne 0 ];then
    echo "you must have the root access to execute this"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ];then
        echo "$2 failure"
        exit 1
    else
        echo "$2  is success"
    fi
}

dnf list installed gcc &>>$log_Name
if [ $? -ne 0 ]; then
    dnf install gcc -y &>>$log_Name
    validate $1 "installing gcc" 
else
    echo "alaredy gcc is available"
fi