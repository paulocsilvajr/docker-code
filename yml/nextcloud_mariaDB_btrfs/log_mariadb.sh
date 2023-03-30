#!/usr/bin/env bash

# watch -n 1 -c 'docker-compose logs --tail 30 db'
docker-compose logs --tail 30 -f db
