#!/usr/bin/env bash

BASE=$(dirname $0)

docker-compose -p linuxserver-nextcloud -f $BASE/docker-compose.yml ps
