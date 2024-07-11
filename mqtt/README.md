# MQTT

## Setup

To install or update, run:

```bash
bash -c "$(wget -qO - https://raw.githubusercontent.com/jannoelc/home-server/develop/lxc/mqtt/install.sh)"
```

Add user and password

```bash
mosquitto_passwd - c /etc/mosquitto/passwd <user>;
```

Then restart mosquitto

```bash
systemctl restart mosquitto
```
