#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ];then
    echo "you must have the root access to excute this"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ];then
        echo "$1 installing package is failure"
        exit 1
    else
        echo "$1 installing package i success"
    fi
}

dnf list installed mysql 
if [ $? -ne 0 ];then
    dnf instally mysql -y
        validate $? "install mysql"
else
    echo "already mysql installed"
fi