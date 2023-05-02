#!/usr/bin/env bash

BASE=$(dirname $0)

docker-compose -p nextcloud-btrfs -f $BASE/docker-compose.yml down && 
    $BASE/umount_volume.sh
