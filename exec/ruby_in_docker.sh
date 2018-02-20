#!/bin/bash

EXT=rb
IMAGEM=ruby:latest
CONTAINER=my-ruby-script
WORKDIR=/usr/src/myapp
EXECUTAVEL=ruby

if [ -e $1 ]; then
    ORIGEM=$1
    # extração do diretório do arquivo.rb
    VOLUME=$(echo "${ORIGEM%/*.$EXT}")
    # extração do nome do arquivo.rb baseado no caminho informado pelo usuário como parâmentro
    ARQUIVO=$(echo $ORIGEM | awk -F '/' '{print $NF}')

    if [ "$VOLUME" == "$ARQUIVO" ]; then
        VOLUME=$PWD
        ORIGEM=$VOLUME/$ARQUIVO

    elif [ "${VOLUME:0:1}" != "/" ]; then
        VOLUME=$PWD/$VOLUME
        ORIGEM=$VOLUME/$ARQUIVO
    fi

    echo "Origem:             $ORIGEM"
    echo "Volume a montar:    $VOLUME"
    echo -e "Arquivo a executar: $ARQUIVO\n\n"

    # rodando container temporário com ruby nomeado my-ruby-script para o arquivo.rb no volume montado informado
    # docker run -it --rm \
    #        --name my-running-script \
    #        -v "$VOLUME":/usr/src/myapp \
    #        -w /usr/src/myapp \
    #        ruby:latest \
    #        ruby $ARQUIVO
    docker run -it --rm \
           --name $CONTAINER \
           -v "$VOLUME":$WORKDIR \
           -w $WORKDIR \
           $IMAGEM \
           $EXECUTAVEL $ARQUIVO

else
    echo "Informe um arquivo.rb como parâmetro"
    exit 1
fi
