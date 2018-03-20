#!/bin/bash

EXT=go
IMAGEM=192.168.1.200:5000/golang:1.10.0-alpine3.7
CONTAINER=my-go-program
WORKDIR=/usr/src/myapp
EXECUTAVEL='go build -v'

if [ -e $1 ]; then
    ORIGEM=$1
    # extração do diretório do arquivo.go
    VOLUME=$(echo "${ORIGEM%/*.$EXT}")
    # extração do nome do arquivo.go baseado no caminho informado pelo usuário como parâmetro
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
    echo -e "Arquivo a compilar: $ARQUIVO\n\n"

    # rodando container temporário com go nomeado my-go-program para o arquivo.go no volume montado informado
    # docker run --rm \
    #     --name my-go-program \
    #     -v "$PWD":/usr/src/myapp \
    #     -w /usr/src/myapp \
    #     golang:1.8 \
    #     go build -v
    docker run --rm \
        --name $CONTAINER \
        -v "$VOLUME":$WORKDIR \
        -w $WORKDIR \
        $IMAGEM \
        $EXECUTAVEL $ARQUIVO

else
    echo "Informe um arquivo.$EXT como parâmetro"
    exit 1
fi
