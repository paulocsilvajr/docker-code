#!/bin/bash

# fonte:
# https://rustdesk.com/docs/pt/self-host/rustdesk-server-oss/docker/
# https://rustdesk.com/docs/pt/self-host/rustdesk-server-oss/install/
# https://rustdesk.com/docs/pt/self-host/client-configuration/

docker run --name hbbs -v ./data:/root -td --net=host --restart unless-stopped rustdesk/rustdesk-server hbbs
docker run --name hbbr -v ./data:/root -td --net=host --restart unless-stopped rustdesk/rustdesk-server hbbr

echo
docker container ls -f name=hbbs -f name=hbbr

echo "Os containeres 'hbbs' e 'hbbr' iniciam com o SO, juntamenteo com o serviço do docker"

echo
echo "Aberto portas 21114-21119 TCP e 21116 UDP em UFW"
sudo ufw allow 21114/tcp
sudo ufw allow 21115/tcp
sudo ufw allow 21116/tcp
sudo ufw allow 21116/udp
sudo ufw allow 21117/tcp
sudo ufw allow 21118/tcp
sudo ufw allow 21119/tcp

echo
echo "Em clientes do Rustdesk > Configurações > Rede > Servidor ID/Relay, informe:"
echo "Servidor de ID: IP do servidor"
echo "Servidor de Relay e Servidor de API pode-se omitir"
echo "Key: KEY gerada no arquivo 'data/id_ed25519.pub'"
echo "OK para salvar"
echo "Na tela inicial de Rustdesk, na barra de status na parte de baixo da janela, deve apresentar somente o status 'Pronto' se o servidor auto hospedado foi configurado corretamente"
echo "Mais detalhes em 'https://rustdesk.com/docs/en/self-host/client-configuration/'"

