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

# additional setup
cd ~/Desktop
mkdir logs

# run on boot
echo >> /home/pi/.bashrc
echo >> /home/pi/.bashrc
echo "# iozt startup" >> /home/pi/.bashrc
echo "sh ~/Desktop/dallas-iozt-pi-scripts/run.sh" >> /home/pi/.bashrc

echo "> Pi setup complete"
read -p "Reboot? (y/n): " reboot
if [ $reboot == "y" ]; then 
sudo reboot
else
echo "Please reboot for changes to take effect."
fi
