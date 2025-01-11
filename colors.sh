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

if 
