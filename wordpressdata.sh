#!/bin/bash
sudo yum -y update
sudo yum -y install git docker
sudo systemctl start docker
sudo systemctl enable docker
sudo chmod 666 /var/run/docker.sock
sudo curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
git clone https://github.com/GOUSERABBANI44/wordpress.git
cd wordpress
docker-compose up -d
