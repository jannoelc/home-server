#!/usr/bin/env bash

DIR_NAME="main"

git clone --filter=blob:none --sparse \
    https://github.com/jannoelc/home-server.git dogehome

cd dogehome

git sparse-checkout add $DIR_NAME

git checkout develop
