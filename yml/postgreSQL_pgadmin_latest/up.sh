#!/usr/bin/env bash

DIRBASE=/home/docker
DIRPOSTGRES="$DIRBASE/postgresql-data-latest"
DIRPGADMIN="$DIRBASE/pgadmin-latest"

echo_azul() {
    echo -e "\033[0;34m$1\033[0m"
}

case $1 in
    -u | --update)
        echo_azul "Atualizando containers de PostgreSQL e PgAdmin"
        docker pull dpage/pgadmin4:latest
        docker pull postgres:latest

        DATA=$(date +%Y%m%d%H%M%S)
        echo_azul "\nCriando backup de pasta $DIRPOSTGRES como $DIRPOSTGRES.$DATA"
        sudo mv -v $DIRPOSTGRES "$DIRPOSTGRES.$DATA"
        echo
    ;;
    -h | --help)
        echo "$0 script para subir um banco de dados PostgreSQL e o PgAdmin via docker e docker-compose"
        echo "  -u Faz o update dos containers DOCKER do PostgreSQl/PgAdmin e cria um backup da pasta do $DIRPOSTGRES com a data completa da execução dessa tarefa"
        exit 0
    ;;
esac


if [ ! -d "$DIRPOSTGRES" ] || [ ! -d "$DIRPGADMIN" ]; then
    echo_azul "Criando diretórios de volumes do PostgreSQL e PgAdmin em $DIRBASE como root" &&
        sudo mkdir "$DIRPOSTGRES" "$DIRPGADMIN" &&
        sudo chown -R 5050:5050 "$DIRPGADMIN" &&
        echo -n " - " &&  echo_azul "OK"
else
    echo_azul "Diretório de volumes do PostgreSQL e PgAdmin em $DIRBASE já existem"
fi

sudo chmod 775 -R "$DIRPOSTGRES" "$DIRPGADMIN" && echo_azul "Atualizado permissão para pastas de PostgreSQL e PgAdmin"

docker-compose -p postgresqlpgadminlatest up -d
