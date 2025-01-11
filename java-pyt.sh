#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ];then
    echo "For this you must have the execute access"
    exit 1
fi

package=$1
package=$2

dnf list installed $1
 if [ $? -ne 0 ];then
    dnf install $1 -y
            if [ $? -ne 0 ];then
            echo "$1 installing failure"
            exit 1
        else
            echo "$1 installing success"
        fi
else 
    echo "$1 is already available"
fi

dnf list installed $2
    if [ $? -ne 0 ];then
        dnf install $2 -y
            if [ $? -ne 0 ];then
                echo "$2 installing package failure"
                exit 1
            else
                echo "$2 installing package success"
            fi 
    else
        echo "$2 installed package already"
    fi