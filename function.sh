#!/bin/bash

USERID=$(id -u)
package=$1

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


dnf list installed $package
    if [$? -ne 0 ];then
        dnf install $package -y
            validate $? "$package"
    else
        echo "$package"
    fi
