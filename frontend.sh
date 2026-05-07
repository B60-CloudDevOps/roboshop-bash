#!/bin/bash

echo "Configuration Management for frontend in progress"

# I want to make sure that the scirpt has to validate whether the user running the script is root user or not, if not root user, script has to be exited
ID=$(id -u)
COMPONENT="frontend"
LOG="/tmp/${COMPONENT}.log"

if [ $ID -ne 0 ]; then 
    echo -e "\e[35m Script has to executed as a root user or with sudo \e[0m"
    echo -e "Example Usage: \n\t \e[33m sudo bash $0  OR # bash $0 \e[0m"
    exit 1
fi

echo "Disabling the default nginx version"
dnf module disable nginx -y &>> $LOG

echo "Enabling Nginx 24 version"
dnf module enable nginx:1.24 -y &>> $LOG

echo "Installing Nginx"
dnf install nginx -y &>> $LOG

echo "Downloading the $COMPONENT component"
curl -L -o /tmp/frontend.zip https://stan-robotshop.s3.amazonaws.com/$COMPONENT-v3.zip &>> $LOG

echo "Performing cleanup:"
cd /usr/share/nginx/html
rm -rf * &>> $LOG

echo "Extracting the $COMPONENT component"
unzip /tmp/$COMPONENT.zip &>> $LOG

echo "Starting the $COMPONENT service"
systemctl enable nginx &>> $LOG
systemctl restart nginx &>> $LOG

echo "Configuration Management for $COMPONENT in completed!"