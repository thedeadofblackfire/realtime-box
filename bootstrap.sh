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
#rm -r /home/src

sudo sed -i -e 's/\r$//' /vagrant/start.sh
#sudo sed -i -e 's/\r$//' /etc/init.d/centrifuged

sudo cp /vagrant/config/nginx.conf /etc/nginx
sudo cp /vagrant/config/centrifuge.nginx.conf /etc/nginx/conf.d
sudo cp /vagrant/config/centrifuged /etc/init.d
sudo sed -i -e 's/\r$//' /etc/init.d/centrifuged
sudo chown root:root /etc/init.d/centrifuged
sudo chmod 0755 /etc/init.d/centrifuged

sudo service centrifuged start
sudo service nginx restart
sudo update-rc.d nginx defaults

#cd /home
#mkdir data
#sudo chown centrifuge:centrifuge data

