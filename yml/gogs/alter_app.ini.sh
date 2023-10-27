#!/usr/bin/env bash

sed -i "s/SSH_PORT         = 22/SSH_PORT         = 10022/g" data/gogs/conf/app.ini && echo "Alterado em arquivo de config. app.ini a porta SSH para 10022"
