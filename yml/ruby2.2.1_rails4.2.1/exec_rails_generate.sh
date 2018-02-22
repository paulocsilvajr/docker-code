#!/bin/bash
PROJETO=$(cat pasta_projeto.txt)
CONTAINER=$1


if [ "$1" == "-h" ]; then
    echo "$0 nomeOuIDConteiner controller nomeController"
elif [ "$(pwd)" == "$PROJETO" ]; then
    if [ "$(docker ps | grep $CONTAINER | awk '{print $NF}')" == "$CONTAINER" ]; then
        docker exec -it $CONTAINER rails generate $2 $3
        sudo chown -vR $USER:$USER *
    else
        echo "Conteiner informado '$CONTAINER' não existe"
    fi
else
    echo "Execute o script $0 da pasta $PROJETO"
fi

