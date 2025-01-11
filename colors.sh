#!/bin/bash

USERID=$(id -u)

R="e\[31m"
G="e\[32m"
Y="e\[33m"
N="e\[0m"

check_root(){
if [ $USERID -ne 0 ];then
    echo "you must have the root access to execute this"
    exit 1
fi
}

check_root

validate(){
    if [ $1 -ne 0 ];then
        echo "$2 $R installing Failur $N"
        exit 1
    else
        echo "$2 $G installing success $N"
    fi
}

dnf list installed nginx
if [ $? -ne 0 ];then
    dnf install nginx -y
    validate $? "install nginx"
else
    echo "$Y Already installed $N"
fi
