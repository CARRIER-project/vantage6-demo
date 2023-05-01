#!/bin/bash

echo "1. Updating the system"
apt-get update -y
apt-get upgrade -y

echo "1a. Installing additional packages"
apt-get install curl
apt-get install python3.8-venv

echo "3. Installing Docker"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

usermod -aG docker ${USER}

echo "4. Creating Python environment"

python3 -m venv ${HOME}/venvs/vantage6

echo "5. Install vantage6"
${HOME}/venvs/vantage6/bin/pip install wheel
${HOME}/venvs/vantage6/bin/pip install vantage6==3.7.0

echo "7. Copy dummy data"
cp ${HOME}/vantage6-demo/data/data.csv ${HOME}/data.csv

echo "Done!"


