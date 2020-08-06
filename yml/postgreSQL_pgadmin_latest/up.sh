#!/usr/bin/env bash

DIRBASE=/home/docker
DIRPOSTGRES="$DIRBASE/postgresql-data-latest"
DIRPGADMIN="$DIRBASE/pgadmin-latest"

if [ ! -d "$DIRPOSTGRES" ] || [ ! -d "$DIRPGADMIN" ]; then
    echo "Criando diretórios de volumes do PostgreSQL e PgAdmin em $DIRBASE como root" &&
    sudo mkdir "$DIRPOSTGRES" "$DIRPGADMIN" &&
    sudo chmod 777 $DIRPOSTGRES $DIRPGADMIN
else
    echo "Diretório de volumes do PostgreSQL e PgAdmin em $DIRBASE já existem"
fi

docker-compose -p postgresqlpgadminlatest up -d
