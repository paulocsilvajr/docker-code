#!/usr/bin/env bash

DIR=$(dirname $0)

docker-compose -p mongodb_curso down && sudo rm -vrf $DIR/data
