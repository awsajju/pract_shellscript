#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "for this you must have the execute access"
    exit 1
fi


dnf list installed mysql

if [ $? -ne 0 ];then
    dnf install mysql -y
        if [ $? -ne 0 ];then
            echo "mysql installing failure"
            exit 1
        else
            echo "mysql installing successful"
        fi
else
    echo "mysql already installed"
fi

dnf list installed git 
if [ $? -ne 0 ];then
    dnf install git -y
        if [ $? -ne 0 ];then
        echo "git installing failure"
        exit 1
    else
        echo "git installing successful"
    fi
else
    echo "git already installed"
fi


    