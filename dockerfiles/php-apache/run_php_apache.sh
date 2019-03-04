#!/bin/bash

NOME_IMG="$(whoami)/php-apache"
NOME_CONTAINER="my-php-apache"

DIR_ATUAL="$(dirname $0)"
DIR_SRC=$DIR_ATUAL/src
DIR_WWW=$HOME/www

IMAGEM=$(docker images | grep $NOME_IMG)

make_base() {
    # cria os diretórios base src e copia o conteúdo de ~/www para src
    if [ ! -d "$DIR_SRC" ]; then
        mkdir $DIR_SRC && echo -e "Criado o diretório $DIR_SRC\n"
    fi
    rsync -avh --progress $DIR_ATUAL/info.php $DIR_SRC
    echo

    if [ ! -d "$DIR_WWW" ]; then
        mkdir $DIR_WWW && echo -e "Criado o diretório $DIR_WWW\n"
    fi
    rsync -avh --progress $DIR_WWW/* $DIR_SRC
    echo
}

make_img() {
    # para e remove o conteiner e remove a imagem antiga
    docker stop $NOME_CONTAINER && echo "Removido conteiner antigo"
    docker rmi $NOME_IMG && echo -e "Removido imagem antiga\n"
    # docker rm $NOME_CONTAINER && \

    # constroi a nova imagem baseado no Dockerfile
    docker build -t $NOME_IMG $DIR_ATUAL/. && \
    echo -e "Criado imagem [$NOME_IMG]\n" && \
    docker images | grep $NOME_IMG
}

run_container() {
    # cria o conteiner descartável(--rm) com o nome informado em NOME_CONTAINER
    docker run -d --rm --name=$NOME_CONTAINER $NOME_IMG && \
    echo -e "\n\nCriado conteiner [$NOME_CONTAINER] baseado na imagem [$NOME_IMG]\n" && \
    docker ps -a | grep $NOME_CONTAINER && \
    docker inspect $NOME_CONTAINER --format='{{json .NetworkSettings}}' $INSTANCE_ID || \
    echo -e "\n\nProblema na criação do conteiner [$NOME_CONTAINER]"
}

make_base

make_img

run_container

