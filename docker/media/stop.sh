#!/bin/bash

base_directory=$(pwd)

stacks="pvr network"

for dir in $stacks; do
    cd $base_directory/$dir
    docker compose down
done