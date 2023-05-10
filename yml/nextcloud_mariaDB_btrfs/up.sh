#!/usr/bin/env bash

BASE=$(dirname $0)

$BASE/mount_volume.sh &&
    docker-compose -p nextcloud-btrfs -f $BASE/docker-compose.yml up -d &&
    echo -e "\nDisponível em 'http://localhost:8082'\n"

