#/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install docker docker-compose wget git unzip -y

chkconfig docker on
service docker start

cd ~
git clone https://github.com/ay-b/grav_default.git
cd ~/grav_default/html
wget https://getgrav.org/download/core/grav-admin/1.3.1 -O grav.zip
unzip grav.zip
mv grav-admin/* ./
cd ..
docker-compose up -d --build
(crontab -l 2>/dev/null; echo "@reboot docker-compose up -f /root/grav_default/Docker-compose.yml") | crontab -