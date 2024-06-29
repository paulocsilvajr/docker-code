#!/usr/bin/env bash

BASE=$(dirname $0)
PASTA_DATA=${BASE}/data

function remove_data() {
    sudo rm -vr $PASTA_DATA
}

echo "Remover a pasta ${PASTA_DATA} apagará definitivamente todos os arquivos do banco de dados MySQL contidos no container"
echo -n "Deseja remover a pasta ${PASTA_DATA}[s|N]: "
read conf

case $conf in
    s | sim | Sim | SIM | y | yes | Yes | YES)
        remove_data
        ;;
    *)
        echo "Cancelado operação"
        ;;
esac