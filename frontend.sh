#!/bin/bash

echo "Configuration Management for frontend in progress"

# I want to make sure that the scirpt has to validate whether the user running the script is root user or not, if not root user, script has to be exited

ID=$(id -u)

if [ $ID -ne 0 ]; then 
    echo -e "\e[35m Script has to executed as a root user or with sudo \e[0m"
    echo -e "Example Usage: \n\t \e[32m sudo bash $0  OR # bash $0 \e[0m"
    exit 1
fi

echo "Disabling the default nginx version"
dnf module disable nginx -y

echo "Enabling Nginx 24 version"
dnf module enable nginx:1.24 -y

echo "Installing Nginx"
dnf install nginx -y