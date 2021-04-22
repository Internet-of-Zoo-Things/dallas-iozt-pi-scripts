#!/bin/bash

if [ `whoami` != "root" ]; then
echo "Error: Must run as root"
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
sudo apt-get install -y nodejs

echo "> Installing development tools"
sudo apt-get update
sudo apt-get install vim -y
sudo apt-get install git -y

echo "> Installing pm2"
npm install -g pm2@4

# setup download directory
echo "> Setting up download directory"
sudo -u pi cd ~/Desktop
sudo -u pi mkdir code
sudo -u pi cd code

# setting up projects
echo "> Cloning projects"
sudo -u pi git clone https://github.com/Internet-of-Zoo-Things/dallas-iozt-app.git
sudo -u pi git clone https://github.com/Internet-of-Zoo-Things/dallas-iozt-connectivity-server.git

echo "> Setting up dallas-iozt-app"
sudo -u pi cd dallas-iozt-app
sudo -u pi npm install
sudo -u pi cp .env.example .env
sudo -u pi npm run build

echo "> Setting up dallas-iozt-connectivity-server"
sudo -u pi cd ../dallas-iozt-connectivity-server
sudo -u pi pip install -r requirements.txt

# additional setup
sudo -u pi cd ~/Desktop
sudo -u pi mkdir logs

# run on boot
sudo -u pi echo >> /home/pi/.bashrc
sudo -u pi echo >> /home/pi/.bashrc
sudo -u pi echo "# iozt startup" >> /home/pi/.bashrc
sudo -u pi echo "sh ~/Desktop/dallas-iozt-pi-scripts/run.sh" >> /home/pi/.bashrc

echo "> Pi setup complete"
read -p "Reboot? (y/n): " reboot
if [ $reboot == "y" ]; then 
sudo reboot
else
echo "Please reboot for changes to take effect."
fi
