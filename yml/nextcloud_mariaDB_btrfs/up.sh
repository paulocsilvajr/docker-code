#!/usr/bin/env bash

BASE=$(dirname $0)

./mount_volume.sh &&
    docker-compose -p nextcloud-btrfs -f $BASE/docker-compose.yml up -d &&
    echo -e "\nDisponível em 'https://localhost:8082'\n"

