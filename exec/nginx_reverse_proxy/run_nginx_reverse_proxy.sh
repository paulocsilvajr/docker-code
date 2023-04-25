#!/usr/bin/env bash

# fonte: https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Docker-Nginx-reverse-proxy-setup-example

docker run -d --name nginx-reverse-proxy --rm -p 80:80 nginx:latest

echo "Execute o script 'copy_config_ngnix.sh' para definir o proxy reverso de acordo com o arquivo 'default.conf' na 2ª entrada de 'location'"
