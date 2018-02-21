#!/bin/bash
PROJETO="/home/kdepaulo/docker/yml/ruby2.2.1_rails4.2.1/myapp"

if [ "$(pwd)" == $PROJETO ]; then
    docker-compose run web rails new . --force
    sudo chown -vR $USER:$USER .

    echo "Recriando imagem com Gemfile atualizado"
    docker-compose build
    echo "A imagem criada deve ter o nome: myapp_web"
    docker images | grep myapp_web

    echo -e "\n\nVerifique com 'docker images' se foi criado uma imagem sem nome e remova-a com 'docker rmi ID'"
else
    echo "Execute o script $0 da pasta $PROJETO"
fi
