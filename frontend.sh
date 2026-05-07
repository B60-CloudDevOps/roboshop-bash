#!/bin/bash

echo "Configuration Management for frontend in progress"

echo "Disabling the default nginx version"
dnf module disable nginx -y

echo "Enabling Nginx 24 version"
dnf module enable nginx:1.24 -y

echo "Installing Nginx"
dnf install nginx -y