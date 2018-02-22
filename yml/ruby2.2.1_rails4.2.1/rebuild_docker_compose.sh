#!/bin/bash
PROJETO=$(cat pasta_projeto.txt)

if [ "$(pwd)" == $PROJETO ]; then
    echo "Recriando imagem com Gemfile atualizado"
    docker-compose build

    echo "A imagem criada deve ter o nome: myapp_web"
    docker images | grep myapp_web

    docker container prune -f

    echo -e "\n\nVerifique com 'docker images' se foi criado uma imagem sem nome e remova-a com 'docker rmi ID'"
else
    echo "Execute o script $0 da pasta $PROJETO"
fi
