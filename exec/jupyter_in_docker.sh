#!/bin/bash

PORTA=8888
USUARIO="paulocsilvajr"
VOLUME=/home/docker/volumes/jupyter
DIR_DOCKERFILE=/home/kdepaulo/repositories/docker-code/dockerfiles/anaconda
NOME_CONTAINER="jupyter-notebook"
NOME_IMAGEM="$USUARIO/miniconda3"

# ORIGINAL(deve ser adicionado --allow-root depois de --no-browser para realmente funcionar;
# acontece erro por docker usar usuário root e não roda o servidor jo jupyter)
# Esta instalação faz o download do jupyter a cada execução. Para evitar esse comportamento
# foi criado um Dockerfile para o miniconda3 que instala o jupyter na sua construção
# docker run -i -t -p 8888:8888 continuumio/miniconda3 /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser"

# tratamento de parâmetros
if [ "$1" == "-d" ]; then
    D=$1
    echo "Executando container em backgroung(detack)"
    echo "Use: docker ps => lista conteiners em execução"
    echo "     docker logs $NOME_CONTAINER => visualiza o log do container informado"
    echo "     docker stop $NOME_CONTAINER => para o container informado"
    echo -e "\n"
elif [ "$1" == "-h" ]; then
    echo "Cria container baseado no continuumio/miniconda3 com Jupyter Notebook"
    echo "Sintaxe: $0 [ -d | -h ]"
    echo "         -d : [Opcional] Container em background, use 'docker logs $NOME_CONTAINER' para visualizar o endereço/token de acesso."
    echo "         -h : [Opcional] Exibe esta ajuda."

    exit 1
else
    D=""
fi


# Gera a imagem caso não exista
if [ "$(docker images | grep '\<paulocsilvajr/miniconda3\>')" == "" ]; then
    echo "Criando imagem $NOME_IMAGEM baseado no arquivo miniconda3.dockerfile"
    cd $DIR_DOCKERFILE
    ./build_miniconda3.sh
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

docker run -it $D --rm --name $NOME_CONTAINER -p $PORTA:8888 -v "$VOLUME":/opt/notebooks $USUARIO/miniconda3 /bin/bash -c "/opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root"
