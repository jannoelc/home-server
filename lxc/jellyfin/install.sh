#!/usr/bin/env bash

DIR_NAME="jellyfin"

cd ~
if [ ! -d "$DIR_NAME" ]; then
    echo "Creating $DIR_NAME directory"
    mkdir "$DIR_NAME"
fi
cd "$DIR_NAME"

if [ ! -d "config" ]; then
    echo "Creating config directory"
    mkdir "config"
fi

echo "Updating docker-compose.yml file"
wget https://raw.githubusercontent.com/jannoelc/home-server/develop/lxc/jellyfin/docker-compose.yml -O docker-compose.yml

if ! [ -e .env ]; then
    echo "Creating .env file"
    wget https://raw.githubusercontent.com/jannoelc/home-server/develop/lxc/jellyfin/.env.sample -O .env
fi
