#!/usr/bin/env bash

# watch -n 1 -c 'docker-compose logs --tail 30 app'
docker-compose logs --tail 30 -f app
