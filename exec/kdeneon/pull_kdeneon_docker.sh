#!/bin/bash

if [ $(id -u) -eq 0 ]; then
    docker pull kdeneon/plasma
else
    echo "Execute como administrador"
fi
