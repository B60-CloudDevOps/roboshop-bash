#!/bin/bash


component=$1
environment=$2
if [ -z "$1" ] && [ -z "$2" ]; then 
    echo -e "Expected usage \n \t : sudo bash $0 componentName envName"
    exit 3
fi 

bash ${1}.sh 