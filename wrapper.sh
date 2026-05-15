#!/bin/bash


COMPONENT=$1
ENVIRONMENT=$2
if [ -z "$1" && -z "$2" ]; then 
    echo -e "Expected usage \n \t : sudo bash $0 componentName envName"
fi 

bash ${1}.sh 