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

echo "> Installing pm2"
npm install -g pm2@4

echo "> Setup part 1 completed. Please run <sh setup2.sh> (not as root)."
