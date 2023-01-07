#!/bin/sh

# @auther Ankush

env_setup(){
sudo apt update -y
sudo apt install python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools -y 

pip install flask -y
pip install wheel -y 
pip install gunicorn flask -y 

sudo apt-get install python3-mysqldb -y

echo "Environment setup is successfully completed"

} 

echo "Starting Environment setup...."
env_setup >> /var/log/env_setup.log 2>&1