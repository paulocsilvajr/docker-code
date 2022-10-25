#!/usr/bin/env bash

BASE=$(dirname $0)
source "$BASE/env.sh"

mkdir data

docker-compose -p $NOMEPROJETO -f $ARQUIVO up -d 
