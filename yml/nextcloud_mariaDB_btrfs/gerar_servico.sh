#!/usr/bin/env bash

BASE=$(dirname $0)
ABS_BASE=$(dirname $(readlink -f $0))
SERVICE_FOLDER=/etc/systemd/system/

UP=$ABS_BASE/nextcloud-btrfs_up.sh
DOWN=$ABS_BASE/nextcloud-btrfs_down.sh

echo "Gerando scripts '$UP' e '$DOWN' usados pelo serviço 'nextcloud-btrfs.service'..."
cp -vi $ABS_BASE/up.sh $UP
cp -vi $ABS_BASE/down.sh $DOWN

echo "Gerando service 'nextcloud-btrfs.service' baseado em arquivo base 'nextcloud-btrfs.service.base'..."
cp -v $ABS_BASE/nextcloud-btrfs.service.base $ABS_BASE/nextcloud-btrfs.service

ESCAPED_REPLACE_START=$(printf '%s\n' "$UP" | sed -e 's/[\/&]/\\&/g')
ESCAPED_REPLACE_STOP=$(printf '%s\n' "$DOWN" | sed -e 's/[\/&]/\\&/g')

sed -i "s/\$SCRIPTINICIO/$ESCAPED_REPLACE_START/g" $BASE/nextcloud-btrfs.service
sed -i "s/\$SCRIPTFIM/$ESCAPED_REPLACE_STOP/g" $BASE/nextcloud-btrfs.service

sudo cp -vi $BASE/nextcloud-btrfs.service $SERVICE_FOLDER &&
    echo "Copiado arquivo do serviço 'nextcloud-btrfs.service' para '$SERVICE_FOLDER'"

echo "Iniciando e ativando serviço 'nextcloud-btrfs'..."
sudo systemctl start nextcloud-btrfs.service

sudo systemctl enable nextcloud-btrfs.service

echo
echo "sudo systemctl daemon-reload  # para recarregar o daemon"
echo "sudo systemctl status nextcloud-btrfs.service  # para status do serviço"
echo "sudo systemctl start nextcloud-btrfs.service  # para inicializar o serviço"
echo "sudo systemctl stop nextcloud-btrfs.service  # para parar o serviço"

