#!/bin/bash
PROJETO=$(cat pasta_projeto.txt)

if [ "$(pwd)" == $PROJETO ]; then
    docker-compose run web rails new . --force
    sudo chown -vR $USER:$USER .

    echo "Recriando imagem com Gemfile atualizado"
    NOME_IMAGEM="myapp_web"
    ID_REMOCAO=$(docker images -q $NOME_IMAGEM)

    docker rmi $ID_REMOCAO

    docker-compose build

    echo "A imagem criada deve ter o nome: myapp_web"
    docker images | grep $NOME_IMAGEM

    docker container prune -f

    echo -e "\n\nVerifique com 'docker images' se foi criado uma imagem sem nome e remova-a com 'docker rmi ID'"
else
    echo "Execute o script $0 da pasta $PROJETO"
fi
