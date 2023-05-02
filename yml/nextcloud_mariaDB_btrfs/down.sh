#!/usr/bin/env bash

docker-compose -p nextcloud-btrfs -f $BASE/docker-compose.yml down && 
    ./umount_volume.sh
