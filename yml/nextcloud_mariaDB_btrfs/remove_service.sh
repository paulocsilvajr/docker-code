#!/usr/bin/env bash

# fonte: https://superuser.com/questions/513159/how-to-remove-systemd-services

SERVICE_FOLDER=/etc/systemd/system
SERVICE_NAME=nextcloud-btrfs.service

sudo systemctl stop $SERVICE_NAME

sudo systemctl disable $SERVICE_NAME

sudo rm $SERVICE_FOLDER/$SERVICE_NAME

sudo systemctl daemon-reload
sudo systemctl reset-failed