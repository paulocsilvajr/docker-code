#!/usr/bin/env bash

docker run -d -p 5000:5000 --restart always --name registry registry:2

echo -e "\n\ndocker tag imagem:tag localhost:5000/imagem:tag  # cria uma tag para enviar ao registry"
echo "docker push localhost:5000/imagem:tag  # envia a imagem associada a tag criada para o registry"
echo "curl localhost:5000/v2/_catalog  # lista as imagens salvas no registry"
