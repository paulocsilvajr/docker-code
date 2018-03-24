#!/bin/bash

if [ $(id -u) -eq 0 ]; then
    host +
    docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=:0 kdeneon/plasma:dev-unstable dolphin
else
    echo "Execute como administrador"
fi
