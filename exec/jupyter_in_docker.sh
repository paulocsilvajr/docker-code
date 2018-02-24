#!/bin/bash

PORTA=8888
USUARIO="paulocsilvajr"

# ORIGINAL(deve ser adicionado --allow-root depois de --no-browser para realmente funcionar;
# acontece erro por docker usar usuário root e não roda o servidor jo jupyter)
# Esta instalação faz o download do jupyter a cada execução. Para evitar esse comportamento
# foi criado um Dockerfile para o miniconda3 que instala o jupyter na sua construção
# docker run -i -t -p 8888:8888 continuumio/miniconda3 /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser"

docker run -i -t -p $PORTA:8888 $USUARIO/miniconda3 /bin/bash -c "echo -e '\n\nUtilize o endereço/link informado  abaixo para acessar o Jupyter Notebook\nCTRL+c para PARAR\n\n' && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root"
