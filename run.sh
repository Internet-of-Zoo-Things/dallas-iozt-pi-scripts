# use pm2 to daemonize processes in case they crash somehow
pm2 start ~/Desktop/code/dallas-iozt-connectivity-server/connectivity_server.sh --log ~/logs/connectivity_server.log
pm2 start ~/Desktop/code/dallas-iozt-app/webapp.sh --log ~/logs/webapp.log
