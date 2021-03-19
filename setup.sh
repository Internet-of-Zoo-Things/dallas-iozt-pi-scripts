#!/bin/bash

#installing Node.js and npm
sudo apt-get update
sudo -s
curl -sL https://deb.nodesource.com/setup_14.x | bash -
sudo apt-get install -y nodejs

#installing vim
sudo apt-get update
sudo apt-get install vim -y

#installing pm2
sudo npm install -g pm2

#daemonize app by adding this command here -  pm2 start <appName>.js

#generating script that will launch pm2 on boot
pm2 startup systemd
pm2 save

#installing git
sudo apt install git-all

#cloning dallas iot zoo app repository
git clone https://github.com/Internet-of-Zoo-Things/dallas-iozt-app.git

#installing all dependencies
cd dallas-iozt-app
npm install
