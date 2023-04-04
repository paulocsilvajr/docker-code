#!/usr/bin/env bash

BASE=$(dirname $0)

ARQUIVO=volume.img
ARQUIVO="${BASE}/${ARQUIVO}"

TAMANHO=20G  # Tamanho em GiB(1024*1024*1024)

if [ -f "$ARQUIVO" ]; then
    echo "Arquivo '$ARQUIVO' já existe" &&
        file "$ARQUIVO"
else
    echo "Criando volume BTRFS de $TAMANHO... denominado '$ARQUIVO'"

    fallocate -l ${TAMANHO} "$ARQUIVO" &&
        sudo mkfs.btrfs -f "$ARQUIVO"
fi

