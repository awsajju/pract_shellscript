#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ];then
    echo "For this you must have the execute access"
    exit 1
fi

dnf list installed $package
 if [ $? -ne 0 ];then
    dnf install $package -y
            if [ $? -ne 0 ];then
            echo "$1 installing failure"
            exit 1
        else
            echo "$1 installing success"
        fi
else 
    echo "$1 is already available"
fi
