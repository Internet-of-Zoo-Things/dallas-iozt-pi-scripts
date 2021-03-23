#!/bin/bash

if [ whoami == "root" ]; then
echo "Error: Must not run as root"
exit 1
else
echo "> Starting setup script..."
fi

# setup raspberry pi
echo "> Updating Raspberry Pi"
sudo apt-get update && apt-get upgrade

# installing
echo "> Installing NPM/Node.js"
curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt-get install -y nodejs

echo "> Installing development tools"
sudo apt-get update
sudo apt-get install vim -y
sudo apt-get install git

echo "> Installing pm2"
npm install -g pm2

# setup download directory
echo "> Setting up download directory"
cd ~/Desktop
mkdir code
cd code

#daemonize app by adding this command here -  pm2 start <appName>.js

# generating script that will launch pm2 on boot
# pm2 startup systemd
# pm2 save

# # cloning dallas iot zoo app repository
# git clone https://github.com/Internet-of-Zoo-Things/dallas-iozt-app.git

# # installing all dependencies
# cd dallas-iozt-app
# npm install
