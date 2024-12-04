#!/bin/bash

# fonte: https://rustdesk.com/docs/pt/self-host/rustdesk-server-oss/docker/

docker run --name hbbs -v ./data:/root -td --net=host --restart unless-stopped rustdesk/rustdesk-server hbbs
docker run --name hbbr -v ./data:/root -td --net=host --restart unless-stopped rustdesk/rustdesk-server hbbr
