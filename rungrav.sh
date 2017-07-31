#/bin/bash
echo "
====================================================
||                     ATTENTION                  ||
====================================================
||  If the script exited with error, then check:  ||
||  1. Internet connection. May be it's limited   ||
||  2. Your /var/www folder must be empty         ||
====================================================
"
yum update -y
yum upgrade -y
yum install epel-release -y
yum install docker docker-compose wget git unzip -y

chkconfig docker on
service docker start

mkdir -p /var/www
cd /var/www
git clone https://github.com/ay-b/grav_default.git .
cd ./html
wget https://getgrav.org/download/core/grav-admin/1.3.1 -O grav.zip
unzip grav.zip
mv grav-admin/* ./ && rm -rf ./grav-admin 
cd ..
docker-compose up -d --build
(crontab -l 2>/dev/null; echo "@reboot docker-compose up -f /var/www/Docker-compose.yml -d") | crontab -

echo "
====================================================
||               OKAY WE'RE DONE                  ||
====================================================
||  Now you can check your Grav web-site by IP    ||
||  or domain name if you have one already here   ||
||  Don't launch the script again, please         ||
====================================================
"
