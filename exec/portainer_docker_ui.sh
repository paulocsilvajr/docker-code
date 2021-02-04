#!/usr/bin/env bash

#Fonte: https://www.cloudsavvyit.com/8911/how-to-get-started-with-portainer-a-web-ui-for-docker/
docker volume create portainer_data
docker run -d -p 9000:9000 --name=portainer --restart=unless-stopped -v "/var/run/docker.sock:/var/run/docker.sock" -v portainer_data:/data portainer/portainer-ce
firefox 127.0.0.1:9000
