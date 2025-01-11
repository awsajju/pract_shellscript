#!/bin/bash

USERID=(id -u)

if [ $USERID -ne 0 ];then
    echo "You must have the sudo access to execute this"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "mysql installing failure"
else
    echo "mysql installing success"
fi
