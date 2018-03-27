#!/bin/bash

read -p "Criar container temporário?(s/N) " TEMPORARIO

PORTA=5050
CONTEINER='pgadmin4'

if [ "${TEMPORARIO^^}" == "S" ]; then
    docker run --rm -p $PORTA:5050 thajeztah/pgadmin4
else
    docker run -p $PORTA:5050 --name $CONTEINER thajeztah/pgadmin4 >> pgadmin4.log &
    echo "Criado container denominado '$CONTEINER' na porta $PORTA"
fi

