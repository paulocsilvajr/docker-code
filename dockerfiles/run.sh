#!/bin/bash

DOCKERFILE=$1
IMAGEM=$2
CONTAINER=$3

if [ -e $DOCKERFILE ] && [ ! -z $IMAGEM ]; then
    if [ -z $CONTAINER ]; then
        CONTAINER=$IMAGEM
    fi

    echo $DOCKERFILE $IMAGEM $CONTAINER

    exit 1

    docker rmi $IMAGEM

    docker build -t $IMAGEM -f $DOCKERFILE .

    clear

    # --rm container temporário, somente existe enquanto está em execução
    docker run -it --rm --name $CONTAINER $IMAGEM
else
    echo "Dockerfile($DOCKERFILE) inexistente ou nome de imagem informado vazio"
    echo "SINTAXE:"
    echo "$0 dockerfile nome_imagem [nome_container]"
fi
