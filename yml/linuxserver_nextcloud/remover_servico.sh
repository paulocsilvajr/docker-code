#!/usr/bin/env bash

# fonte: https://superuser.com/questions/513159/how-to-remove-systemd-services

SERVICE_FOLDER=/etc/systemd/system

sudo systemctl stop linuxserver_nextcloud.service

sudo systemctl disable linuxserver_nextcloud.service

sudo rm $SERVICE_FOLDER/linuxserver_nextcloud.service

sudo systemctl daemon-reload
sudo systemctl reset-failed