#!/bin/bash

# I want to make sure that the scirpt has to validate whether the user running the script is root user or not, if not root user, script has to be exited
COMPONENT="redis"
source ./common.sh
ENVIRONMENT="$1"
VERSION=7

if [ $ID -ne 0 ]; then 
    echo -e "\e[35m Script has to executed as a root user or with sudo \e[0m"
    echo -e "Example Usage: \n\t \e[33m sudo bash $0  OR # bash $0 \e[0m"
    exit 1
fi

echo -n "Disabling $COMPONENT default version :"
dnf module disable redis -y &>> $LOG 
stat $?

echo -n "Enabling $COMPONENT $VERSION version :"
dnf module enable redis:7 -y &>> $LOG 
stat $?

echo -n "Installing $COMPONENT:"
dnf install redis -y  &>> $LOG 
stat $? 

echo -n "Updating the $COMPONENT visibility:"
sed -ie 's/127.0.0.1/0.0.0.0/' /etc/redis/redis.conf  &>> $LOG 
stat $?

echo -n "Updating the $COMPONENT protected mode:"
sed -ie 's/protected-mode yes/protected-mode no/' /etc/redis/redis.conf  &>> $LOG 
stat $?

echo -n "Starting $COMPONENT service:"
systemctl enable $COMPONENT  &>> $LOG 
systemctl restart $COMPONENT  &>> $LOG 
stat $?

echo -e "\n \t ___ Configuration Management for $COMPONENT $ENVIRONMENT in completed! ___"