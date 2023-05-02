#!/usr/bin/env bash

# fonte: https://superuser.com/questions/513159/how-to-remove-systemd-services

SERVICE_FOLDER=/etc/systemd/system

sudo systemctl stop nextcloud-btrfs.service

sudo systemctl disable nextcloud-btrfs.service

sudo rm $SERVICE_FOLDER/nextcloud-btrfs.service

sudo systemctl daemon-reload
sudo systemctl reset-failed