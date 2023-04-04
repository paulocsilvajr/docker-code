#!/usr/bin/env bash

BASE=$(dirname $0)

$BASE/mount_volume.sh &&
    docker-compose -p linuxserver-nextcloud -f $BASE/docker-compose.yml up -d  &&
    echo -e "\nDisponível em 'https://localhost:8443'\n" &&
    echo "Na 1ª inicialização:" &&
    echo " - Pode demorar um pouco para inicializar" &&
    echo " - Deve-se informar um nome de usuário/senha para o administrador" &&
    echo " - Em 'Armazenamento & banco de dados', deve-se selecionar 'MySQL/MariaDB' e informar usuário, senha e nome do banco de dados de acordo com o arquivo 'docker-compose'. No campo 'Host do banco de dados', deve-se informar o serviço 'linuxserver_nextcloud_db'"
