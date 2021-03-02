#!/usr/bin/env bash

USER=admin
PASSWORD=admin
PORT=3306
ROOTPW=masterkey

docker run -d -p $PORT:3306 --name mysql-container -v MySQLDB:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=$ROOTPW -e MYSQL_USER=$USER -e MYSQL_PASSWORD=$PASSWORD mysql:5.7 &&
    echo "Configurações do Container MySQL:"
    echo "Porta: $PORT"
    echo "Usuário: $USER"
    echo "Senha: $PASSWORD"
    echo "Senha root: $ROOTPW"
    echo "Criado volume MySQLDB, detalhes com comando abaixo:"
    echo "docker volume inspect MySQLDB;"

