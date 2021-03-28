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
sudo apt-get install git -y

echo "> Installing pm2"
npm install -g pm2

# setup download directory
echo "> Setting up download directory"
cd ~/Desktop
mkdir code
cd code

# setting up projects
echo "> Cloning projects"
git clone https://github.com/Internet-of-Zoo-Things/dallas-iozt-app.git
git clone https://github.com/Internet-of-Zoo-Things/dallas-iozt-connectivity-server.git

echo "> Setting up dallas-iozt-app"
cd dallas-iozt-app
npm install
cp .env.example .env
npm run build

echo "> Setting up dallas-iozt-connectivity-server"
cd ../dallas-iozt-connectivity-server
pip install -r requirements.txt

#daemonize app by adding this command here -  pm2 start <appName>.js

# generating script that will launch pm2 on boot
# pm2 startup systemd
# pm2 save


