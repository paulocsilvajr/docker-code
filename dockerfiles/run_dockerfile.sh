#!/bin/bash

DOCKERFILE='./nome.dockerfile'
IMAGEM='nome_imagem'
CONTAINER='nome_container'

if [ -e $DOCKERFILE ]; then
    docker rmi $IMAGEM

    docker build -t $IMAGEM -f $DOCKERFILE .

    clear

    # --rm container temporário, somente existe enquanto está em execução
    docker run -it --rm --name $CONTAINER $IMAGEM
else
    echo "Dockerfile($DOCKERFILE) inexistente"
fi
