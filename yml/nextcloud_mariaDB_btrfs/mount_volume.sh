#!/usr/bin/env bash

BASE=$(dirname $0)

ARQUIVO=volume.img
ARQUIVO="${BASE}/${ARQUIVO}"

MONTAGEM="${BASE}/data"

if [ -f "$ARQUIVO" ]; then
    sudo mkdir -vp "$MONTAGEM"

    echo "Montando '$ARQUIVO' em '$MONTAGEM'... " &&
        sudo mount -o loop -v "$ARQUIVO" "$MONTAGEM" &&
        sudo btrfs subvolume create "${MONTAGEM}/nextcloud" &&
        sudo btrfs subvolume create "${MONTAGEM}/db"

    df -hT "$MONTAGEM"
else
    echo "Crie o arquivo '$ARQUIVO' com o script 'create_volume_btrfs.sh'"
    exit 1
fi
