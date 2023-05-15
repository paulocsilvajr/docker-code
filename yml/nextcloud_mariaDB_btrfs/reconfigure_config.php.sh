#!/usr/bin/env bash

BASE=$(dirname $0)
CONFIG=$BASE/data/nextcloud/config/config.php

# Comentado porque Nextcloud funcionou corretamente somente com as entradas das config 'overwritehost' e 'overwriteprotocol'
# TRUSTED_DOMAINS="0 => 'localhost',"
# REPLACE_TRUSTED_DOMAINS="0 => 'localhost:8083',"

# OVERWRITECLIURL="'overwrite.cli.url' => 'http:\/\/localhost',"
# REPLACE_OVERWRITECLIURL="'overwrite.cli.url' => 'https:\/\/localhost:8083',"

END=");"
OVERWRITEHOST="  'overwritehost' => 'localhost:8083',"
OVERWRITEPROTOCOL="  'overwriteprotocol' => 'https',"

if [ -f $CONFIG ]; then
    # sudo sed -i "s/$TRUSTED_DOMAINS/$REPLACE_TRUSTED_DOMAINS/g" $CONFIG

    # sudo sed -i "s/$OVERWRITECLIURL/$REPLACE_OVERWRITECLIURL/g" $CONFIG

    test_OVERWRITEHOST=$(sudo grep "$OVERWRITEHOST" $CONFIG)
    if [ -z "$test_OVERWRITEHOST" ]; then
        sudo sed -i "s/$END/$OVERWRITEHOST/g" $CONFIG
        echo $END | sudo tee -a $CONFIG
    fi

    test_OVERWRITEPROTOCOL=$(sudo grep "$OVERWRITEPROTOCOL" $CONFIG)
    if [ -z "$test_OVERWRITEPROTOCOL" ]; then
        sudo sed -i "s/$END/$OVERWRITEPROTOCOL/g" $CONFIG
        echo $END | sudo tee -a $CONFIG
    fi

    echo "Reinicie o serviço do Nextcloud para que as alterações das configurações seja aplicadas ou execute:"
    echo "docker exec nextcloud-btrfs-container-app /etc/init.d/apache2 reload"
else
    echo "Arquivo de configuração '$CONFIG' não existe ainda, inicie o Nextcloud na rota 'https://localhost:8083' no navegador, para que esse arquivo seja criado."
fi
