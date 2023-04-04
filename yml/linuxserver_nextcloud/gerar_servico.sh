#!/usr/bin/env bash

BASE=$(dirname $0)
ABS_BASE=$(dirname $(readlink -f $0))
SERVICE_FOLDER=/etc/systemd/system/

UP=$ABS_BASE/linuxserver_nextcloud_up.sh
DOWN=$ABS_BASE/linuxserver_nextcloud_down.sh

cp -vi $ABS_BASE/up.sh $UP
cp -vi $ABS_BASE/down.sh $DOWN
cp -v $ABS_BASE/linuxserver_nextcloud.service.base $ABS_BASE/linuxserver_nextcloud.service

ESCAPED_REPLACE_START=$(printf '%s\n' "$UP" | sed -e 's/[\/&]/\\&/g')
ESCAPED_REPLACE_STOP=$(printf '%s\n' "$DOWN" | sed -e 's/[\/&]/\\&/g')

sed -i "s/\$SCRIPTINICIO/$ESCAPED_REPLACE_START/g" $BASE/linuxserver_nextcloud.service
sed -i "s/\$SCRIPTFIM/$ESCAPED_REPLACE_STOP/g" $BASE/linuxserver_nextcloud.service

sudo cp -vi $BASE/linuxserver_nextcloud.service $SERVICE_FOLDER

sudo systemctl start linuxserver_nextcloud

sudo systemctl enable linuxserver_nextcloud

echo
echo "sudo systemctl daemon-reload  # para recarregar o daemon"
echo "sudo systemctl status linuxserver_nextcloud.service  # para status do serviço"
echo "sudo systemctl start linuxserver_nextcloud.service  # para inicializar o serviço"
echo "sudo systemctl stop linuxserver_nextcloud.service  # para parar o serviço"

