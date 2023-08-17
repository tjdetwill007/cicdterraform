#! /bin/bash
sudo yum update -y
sudo dnf install mariadb105-server  mariadb105-devel gcc -y
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo yum install python3-devel -y
sudo yum install pip -y
sudo yum install nginx -y
sudo yum install expect -y