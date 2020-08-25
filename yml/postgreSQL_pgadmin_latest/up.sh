#!/usr/bin/env bash

DIRBASE=/home/docker
DIRPOSTGRES="$DIRBASE/postgresql-data-latest"
DIRPGADMIN="$DIRBASE/pgadmin-latest"

echo_azul() {
    echo -e "\033[0;34m$1\033[0m"
}

if [ ! -d "$DIRPOSTGRES" ] || [ ! -d "$DIRPGADMIN" ]; then
    echo -n "Criando diretórios de volumes do PostgreSQL e PgAdmin em $DIRBASE como root" &&
    sudo mkdir "$DIRPOSTGRES" "$DIRPGADMIN" &&
    sudo chown -R 5050:5050 "$DIRPGADMIN" &&
    sudo chmod 777 "$DIRPOSTGRES" "$DIRPGADMIN" &&
    echo -n " - " &&  echo_azul "OK"
else
    echo_azul "Diretório de volumes do PostgreSQL e PgAdmin em $DIRBASE já existem"
fi

docker-compose -p postgresqlpgadminlatest up -d
