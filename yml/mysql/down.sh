#!/usr/bin/env bash

BASE=$(dirname $0)
source "$BASE/env.sh"

docker-compose -p $NOMEPROJETO -f $ARQUIVO down
