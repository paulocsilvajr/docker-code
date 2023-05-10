#!/usr/bin/env bash

BASE=$(dirname $0)

ARQUIVO=volume.img
ARQUIVO="${BASE}/${ARQUIVO}"

sudo umount -v "$ARQUIVO" &&
    rmdir -v "${BASE}/data"
