#!/usr/bin/env bash

watch -n 1 -c 'docker logs --tail 30 $(docker-compose ps -q db)'
