#!/bin/bash

base_directory=$(pwd)

stacks="network admin apps smart_home"

for dir in $stacks; do
    cd $base_directory/$dir
    docker compose up -d
done