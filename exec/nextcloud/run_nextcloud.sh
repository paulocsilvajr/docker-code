#!/usr/bin/env bash

docker run -d -v /home/docker/volumes/nextcloud/data:/var/www/html -p 8080:80 --name=nextcloud --restart always nextcloud:16-apache &&
    echo "Criado container 'nextcloud' perpétuo disponível no endereço: localhost:8080"

