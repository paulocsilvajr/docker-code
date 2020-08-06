#!/usr/bin/env bash

imprime_vermelho() {
    echo -e "\033[0;31m$1\033[0m"
}

grep "PGADMIN\|POSTGRES" docker-compose.yml
imprime_vermelho 'Para Host name/address da configuração do server do pgadmin, use o nome do container; Para username use postgres'
