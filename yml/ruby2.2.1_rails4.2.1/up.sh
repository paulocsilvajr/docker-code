#!/bin/bash
PROJETO=$(cat pasta_projeto.txt)

if [ "$(pwd)" == $PROJETO ]; then
    docker-compose up -d
else
    echo "Execute o script $0 da pasta $PROJETO"
fi

