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
        echo "installing package failure"
        exit 1
    else
        echo "installing package is success"
    fi
}

dnf list installed tree 
if [ $? -ne 0 ]; then
    dnf install tree -y
    validate $1 "installing tree"
else
    echo "alaredy tree is available"
fi