#!/bin/bash

docker container stop hbbs hbbr &&
    docker container prune

echo "Removido portas de Rustdesk em UFW"
sudo ufw delete allow 21114/tcp
sudo ufw delete allow 21115/tcp
sudo ufw delete allow 21116/tcp
sudo ufw delete allow 21116/udp
sudo ufw delete allow 21117/tcp
sudo ufw delete allow 21118/tcp
sudo ufw delete allow 21119/tcp

