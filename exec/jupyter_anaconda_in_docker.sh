#!/bin/bash

PORTA=8888
USUARIO="paulocsilvajr"
VOLUME=/home/docker/volumes/jupyter
DIR_DOCKERFILE=/home/kdepaulo/repositories/docker-code/dockerfiles/anaconda
NOME_CONTAINER="jupyter-notebook"
NOME_IMAGEM="$USUARIO/anaconda3"

# tratamento de parâmetros
if [ "$1" == "-d" ]; then
    D=$1
    echo "Executando container em backgroung(detack)"
    echo "Use: docker ps => lista conteiners em execução"
    echo "     docker logs $NOME_CONTAINER => visualiza o log do container informado"
    echo "     docker stop $NOME_CONTAINER => para o container informado"
    echo -e "\n"
elif [ "$1" == "-h" ]; then
    echo "Cria container baseado no continuumio/anaconda3 com Jupyter Notebook"
    echo "Sintaxe: $0 [ -d | -h ]"
    echo "         -d : [Opcional] Container em background, use 'docker logs $NOME_CONTAINER' para visualizar o endereço/token de acesso."
    echo "         -h : [Opcional] Exibe esta ajuda."

    exit 1
else
    D=""
fi


# Gera a imagem caso não exista
if [ "$(docker images | grep '\<paulocsilvajr/anaconda3\>')" == "" ]; then
    echo "Criando imagem $NOME_IMAGEM baseado no arquivo anaconda3.dockerfile"
    cd $DIR_DOCKERFILE
    ./build_anaconda3.sh
else
    echo "Imagem $NOME_IMAGEM já existe"
fi

echo "Continuando criação de container temporário $NOME_CONTAINER"

# Cria pasta de volume caso não exista
if [ -z "$VOLUME" ]; then
    mkdir $VOLUME
fi

echo -e "\nUtilize o endereço/link informado abaixo para acessar o Jupyter Notebook"
echo "CTRL+c para PARAR"
echo -e "Volume criado em: $VOLUME\n\n"

docker run -it $D --rm --name $NOME_CONTAINER -p $PORTA:8888 -v "$VOLUME":/opt/notebooks $USUARIO/anaconda3 /bin/bash -c "/opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root"
