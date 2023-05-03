#!/usr/bin/env bash

BASE=$(dirname $0)
ABS_BASE=$(dirname $(readlink -f $0))
SERVICE_FOLDER=/etc/systemd/system/
SERVICE_NAME=nextcloud-btrfs.service

UP=$ABS_BASE/nextcloud-btrfs_up.sh
DOWN=$ABS_BASE/nextcloud-btrfs_down.sh

echo "Gerando scripts '$UP' e '$DOWN' usados pelo serviço '$SERVICE_NAME'..."
cp -vi $ABS_BASE/up.sh $UP
cp -vi $ABS_BASE/down.sh $DOWN

echo "Gerando service '$SERVICE_NAME' baseado em arquivo base '$SERVICE_NAME.base'..."
cp -v $ABS_BASE/$SERVICE_NAME.base $ABS_BASE/$SERVICE_NAME

ESCAPED_REPLACE_START=$(printf '%s\n' "$UP" | sed -e 's/[\/&]/\\&/g')
ESCAPED_REPLACE_STOP=$(printf '%s\n' "$DOWN" | sed -e 's/[\/&]/\\&/g')

sed -i "s/\$SCRIPTINICIO/$ESCAPED_REPLACE_START/g" $BASE/$SERVICE_NAME
sed -i "s/\$SCRIPTFIM/$ESCAPED_REPLACE_STOP/g" $BASE/$SERVICE_NAME

sudo cp -vi $BASE/$SERVICE_NAME $SERVICE_FOLDER &&
    echo "Copiado arquivo do serviço '$SERVICE_NAME' para '$SERVICE_FOLDER'"

echo "Iniciando e ativando serviço '$SERVICE_NAME'..."
sudo systemctl start $SERVICE_NAME

sudo systemctl enable $SERVICE_NAME

echo
echo "sudo systemctl daemon-reload  # para recarregar o daemon"
echo "sudo systemctl status $SERVICE_NAME  # para status do serviço"
echo "sudo systemctl start $SERVICE_NAME  # para inicializar o serviço"
echo "sudo systemctl stop $SERVICE_NAME  # para parar o serviço"

