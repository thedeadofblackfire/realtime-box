#!/usr/bin/env bash

#groupadd -r centrifuge 
#useradd -r -g centrifuge centrifuge

apt-get update
apt-get install -y git build-essential python-dev python-pip nginx

cd /home
mkdir src
cd /home/src
git clone https://github.com/centrifugal/centrifuge.git
cd centrifuge
python setup.py install 
rm -r /home/src

#cd /home
#mkdir data
#sudo chown centrifuge:centrifuge data

