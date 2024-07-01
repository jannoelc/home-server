#!/usr/bin/env bash

DIR_NAME="main"

cd ~
if [ ! -d "$DIR_NAME" ]; then
    echo "Creating $DIR_NAME directory"
    mkdir "$DIR_NAME"
fi
cd "$DIR_NAME"

echo "Updating docker-compose.yml file"
wget https://raw.githubusercontent.com/jannoelc/home-server/develop/lxc/$DIR_NAME/docker-compose.yml -O docker-compose.yml

if ! [ -d caddy ]; then
    echo "Creating caddy directory"
    mkdir caddy
fi

wget https://raw.githubusercontent.com/jannoelc/home-server/develop/lxc/$DIR_NAME/caddy/Caddyfile -O caddy/Caddyfile

if ! [ -e .env ]; then
    echo "Creating .env file"
    wget https://raw.githubusercontent.com/jannoelc/home-server/develop/lxc/$DIR_NAME/.env.sample -O .env
fi
