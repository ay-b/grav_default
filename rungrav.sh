#/bin/bash

yum update -y
yum upgrade -y
yum install epel-release -y
yum install docker docker-compose wget git -y

chkconfig docker on
service docker start

wget https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/ay-b/docker/tree/master/grav -O rungrav.zip
unzip rungrav.zip 
cd rungrav
wget https://getgrav.org/download/core/grav-admin/1.3.1 -O grav.zip
unzip grav.zip
mv grav-admin/* html/
