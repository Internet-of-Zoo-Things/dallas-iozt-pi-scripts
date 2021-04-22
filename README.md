# dallas-iozt-pi-scripts
Shell scripts used by the Raspberry Pis

# Install script

This script should be ran once as root when setting up the Pi to download the required programs and packages. This looks like:

```
git clone https://github.com/Internet-of-Zoo-Things/dallas-iozt-pi-scripts.git
cd dallas-iozt-pi-scripts
sudo setup.sh
```

# Boot script

This script should run every time the Raspberry Pi boots, and will initialize all necessary servers/daemons. This can be ran from the `/home/pi/.bashrc` file as [described here](https://www.dexterindustries.com/howto/run-a-program-on-your-raspberry-pi-at-startup/#bash).

The boot script utilizes `pm2` to daemonize the necessary processes in case they crash. All currently running processes can be viewed by running `pm2 ls`.

# Additional optional configuration

* [Install VSCode](https://code.visualstudio.com/docs/?dv=linuxarmhf_deb)

# Additional documentation

* [pm2](https://pm2.keymetrics.io/docs/usage/quick-start)
