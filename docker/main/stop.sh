#!/bin/bash

base_directory=$(pwd)

stacks="smart_home apps admin network"

for dir in $stacks; do
    cd $base_directory/$dir
    docker compose down
done