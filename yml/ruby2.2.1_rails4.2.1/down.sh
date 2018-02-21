#!/bin/bash
PROJETO="/home/kdepaulo/docker/yml/ruby2.2.1_rails4.2.1/myapp"

if [ "$(pwd)" == $PROJETO ]; then
    docker-compose down
else
    echo "Execute o script $0 da pasta $PROJETO"
fi
