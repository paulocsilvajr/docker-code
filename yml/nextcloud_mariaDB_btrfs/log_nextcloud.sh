#!/usr/bin/env bash

# watch -n 1 -c 'docker-compose logs --tail 30 nextcloud-btrfs-app'
docker-compose logs --tail 30 -f nextcloud-btrfs-app
