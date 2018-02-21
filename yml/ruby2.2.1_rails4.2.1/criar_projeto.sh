#!/bin/bash

if [ "$1" != "" ] && [ -e $1 ]; then
    if [ "$2" == "" ]; then
        PROJETO="myapp"
    else
        PROJETO=$2
    fi

    PASTA_PROJETO=$1/$PROJETO

    mkdir $PASTA_PROJETO
    echo $PASTA_PROJETO > pasta_projeto.txt
    cp -v * $PASTA_PROJETO

    echo -e "\n\nCriado projeto na pasta $PASTA_PROJETO"
    echo
    echo "Acesse a pasta com o comando:"
    echo "cd $PASTA_PROJETO"
    echo -e "\nE execute o comando run_docker_compose.sh"
else
    echo "Diretório informado '$1' não existe."
    echo "$0 /pasta1/.../pasta_n [nome_projeto]"
    echo "Quando omite-se nome do projeto, assume-se 'myapp'"
fi
