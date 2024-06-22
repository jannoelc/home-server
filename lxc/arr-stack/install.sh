#!/usr/bin/env bash

DIR_NAME="arr-stack"

cd ~
if [ ! -d "$DIR_NAME" ]; then
    echo "Creating $DIR_NAME directory"
    mkdir "$DIR_NAME"
fi
cd "$DIR_NAME"

echo "Updating docker-compose.yml file"
wget https://raw.githubusercontent.com/jannoelc/home-server/develop/lxc/$DIR_NAME/docker-compose.yml -O docker-compose.yml

if ! [ -e .env ]; then
    echo "Creating .env file"
    wget https://raw.githubusercontent.com/jannoelc/home-server/develop/lxc/$DIR_NAME/.env.sample -O .env
fi

if [ ! -d vpn ]; then
    echo "Creating vpn directory"
    mkdir vpn
fi
cd vpn
if ! [ -e "wg0.conf" ]; then
    echo "Creating wg0.conf file"
    wget https://raw.githubusercontent.com/jannoelc/home-server/develop/lxc/$DIR_NAME/vpn/wg0.conf -O wg0.conf
fi
