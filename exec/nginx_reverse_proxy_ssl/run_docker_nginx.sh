#!/usr/bin/env bash

docker run --name nginx_proxy_ssl --restart=unless-stopped -d -v `pwd`/conf.d:/etc/nginx/conf.d -p 9443:443 nginx:latest 
