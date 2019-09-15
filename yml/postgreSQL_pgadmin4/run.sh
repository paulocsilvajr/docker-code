#!/usr/bin/env bash

DIR=`dirname $0`

echo "Iniciando container de PostgreSQL..." && $DIR/up.sh &&
    echo "Esperando iniciar o container..." && sleep 10 &&
    echo "Abrindo PgAdmin4 em Firefox..." && $DIR/open_pgadmin4.sh
