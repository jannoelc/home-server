#!/bin/bash

base_directory=$(pwd)

stacks="network pvr"

for dir in $stacks; do
    cd $base_directory/$dir
    docker compose up -d
done