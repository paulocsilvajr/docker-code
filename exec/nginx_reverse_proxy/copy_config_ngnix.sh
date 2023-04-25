#/usr/bin/env bash

docker cp ./default.conf nginx-reverse-proxy:/etc/nginx/conf.d/ &&
    docker exec nginx-reverse-proxy nginx -t &&
    docker exec nginx-reverse-proxy nginx -s reload

