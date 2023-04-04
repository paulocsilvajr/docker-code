#!/usr/bin/env bash

BASE=$(dirname $0)

ARQUIVO=volume.img
ARQUIVO="${BASE}/${ARQUIVO}"

MONTAGEM="${BASE}/data"

sudo mkdir -vp "$MONTAGEM"

echo "Montando '$ARQUIVO' em '$MONTAGEM'... " &&
    sudo mount -o loop -v "$ARQUIVO" "$MONTAGEM" &&
    sudo btrfs subvolume create "${MONTAGEM}/appdata" &&
    sudo btrfs subvolume create "${MONTAGEM}/data" &&
    sudo btrfs subvolume create "${MONTAGEM}/db"

df -hT "$MONTAGEM"

