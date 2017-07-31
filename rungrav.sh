#/bin/bash

yum update -y
yum upgrade -y
yum install epel-release -y
yum install docker docker-compose wget git -y

chkconfig docker on
service docker start

git clone https://github.com/ay-b/grav_default.git
cd grav_default/html
wget https://getgrav.org/download/core/grav-admin/1.3.1 -O grav.zip
unzip grav.zip
mv grav-admin/* ./
cd ..
docker-compose up -d --build
(crontab -l 2>/dev/null; echo "@reboot docker-compose up -f /root/Docker-compose.yml") | crontab -