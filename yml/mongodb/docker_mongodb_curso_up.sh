#!/usr/bin/env bash

# Fonte: https://hub.docker.com/_/mongo

mkdir -v data

docker-compose -p mongodb_curso up -d
