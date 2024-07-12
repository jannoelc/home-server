#!/usr/bin/env bash

DIR_NAME="remote"

cd ~
if [ ! -d "$DIR_NAME" ]; then
    echo "Creating $DIR_NAME directory"
    mkdir "$DIR_NAME"
fi
cd "$DIR_NAME"

echo "Updating docker-compose.yml file"
wget https://raw.githubusercontent.com/jannoelc/home-server/develop/lxc/$DIR_NAME/docker-compose.yml -O docker-compose.yml

if ! [ -d tailscale_dns ]; then
    echo "Creating tailscale_dns directory"
    mkdir tailscale_dns
fi

wget https://raw.githubusercontent.com/jannoelc/home-server/develop/lxc/$DIR_NAME/tailscale_dns/dnsmasq.conf -O tailscale_dns/dnsmasq.conf
wget https://raw.githubusercontent.com/jannoelc/home-server/develop/lxc/$DIR_NAME/tailscale_dns/resolv.conf -O tailscale_dns/resolv.conf

if ! [ -e .env ]; then
    echo "Creating .env file"
    wget https://raw.githubusercontent.com/jannoelc/home-server/develop/lxc/$DIR_NAME/.env.sample -O .env
fi
