#!/bin/bash

echo "Configuration Management for $COMPONENT in progress"

ID=$(id -u)
APPUSER="roboshop"
LOG="/tmp/${COMPONENT}.log"

if [ $ID -ne 0 ]; then 
    echo -e "\e[35m Script has to executed as a root user or with sudo \e[0m"
    echo -e "Example Usage: \n\t \e[33m sudo bash $0  OR # bash $0 \e[0m"
    exit 1
fi

stat() {
    if [ $1 -eq 0 ]; then 
        echo -e "\e[32m Success \e[0m"
    else
        echo -e "\e[33m Failure \e[0m "
        exit 2
    fi 
}