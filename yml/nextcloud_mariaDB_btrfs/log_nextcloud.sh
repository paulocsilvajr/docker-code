#!/usr/bin/env bash

docker-compose -p nextcloud-btrfs logs --tail 30 -f nextcloud-btrfs-app
