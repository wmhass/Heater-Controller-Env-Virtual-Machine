!/usr/bin/env bash

sudo yum -y update
sudo yum -y install git
sudo amazon-linux-extras install -y docker
sudo service docker start
sudo usermod -a -G docker vagrant
sudo chkconfig docker on
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose