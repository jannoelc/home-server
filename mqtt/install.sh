DIR_NAME="mqtt"

echo "Updating /etc/mosquitto/conf.d/mqtt.conf file"
wget https://raw.githubusercontent.com/jannoelc/home-server/develop/lxc/$DIR_NAME/mqtt.conf -O /etc/mosquitto/conf.d/mqtt.conf