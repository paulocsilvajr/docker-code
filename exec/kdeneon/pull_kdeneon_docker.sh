#!/bin/bash

if [ $(id -u) -eq 0 ]; then
    docker pull kdeneon/plasma:dev-unstable
else
    echo "Execute como administrador"
fi
