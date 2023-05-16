#!/usr/bin/env bash

BASE=$(dirname $0)

if [ -f $BASE/conf.d/cert.pem ] && [ -f $BASE/conf.d/key.pem ]; then
    $BASE/mount_volume.sh &&
        docker-compose -p nextcloud-btrfs -f $BASE/docker-compose.yml up -d &&
        echo -e "\nDisponível em 'https://localhost:8083'\n"
else
    echo "Certificados inexistentes em '$BASE/conf.d'. Crie os certificados autoassinados com o script 'generate_certificate.sh'"
    exit 1
fi
