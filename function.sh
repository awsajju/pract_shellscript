#!/bin/bash

USERID=$(id -u)

check_root(){
    if [ $USERID -ne 0 ];then
        echo "You Must have the root access to execute this"
        exit 1
    fi
}

check_root

validation(){
    if [ $? -ne 0 ];then
        echo " $2 installing package is failure"
        exit 1
    else
        echo " $2 installing package is success"
    fi
}

package=$1

dnf list installed $1
    if [$? -ne 0 ];then
        dnf install $1 -y
            validate $? "$1"
    else
        echo "package alaready available"
    fi