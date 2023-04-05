# Docker-compose baseado em imagem do Nextcloud do [linuxserver](https://hub.docker.com/r/linuxserver/nextcloud) e imagem do MariaDB. Desenvolvimento para Ubuntu22.04+ e derivados.

Docker-compose para rodar o Nexcloud com banco de dados via conteiner do MariaDB e volume BTRFS para isolar e limitar o armazenamento e possibilitar snapshots instantâneos.

Nextcloud disponível em **https:\\localhost:8443** após sua montagem.

Deve-se usar os scripts *up.sh* e *down.sh* para inicializar e parar os serviços, porque eles montam e desmontam o volume virtual da imagem BTRFS em pasta data.

Na 1ª inicialização, use obrigatoriamente o script *up.sh* para iniciar os serviços(o volume BTRFS deve já ter sido criado com o script *create_volume_btrfs.sh*). A 1ª inicialização pode demorar um pouco para mostrar a página inicial de configuração do Nextcloud.

Na tela inicial de configuração do Nextcloud:
- Deve-se informar um nome de usuário/senha para o administrador.
- Em 'Armazenamento & banco de dados', deve-se selecionar 'MySQL/MariaDB' e informar usuário, senha e nome do banco de dados de acordo com o arquivo 'docker-compose'.
- No campo 'Host do banco de dados', deve-se informar o serviço 'linuxserver_nextcloud_db'.

Foi criado scripts para usar esses conteineres como serviços do Systemctl. Pare os conteineres com o script *down.sh* e use o script *gerar_servico.sh* para criar o serviço do sistema. Use o comando *systemctl*(start|status|stop) para gerenciar o servico **linuxserver_nextcloud.service**.


### Arquivos

```
create_volume_btrfs.sh: Cria uma imagem com 20GiB de tamanho e formatado como BTRFS. Pode-se alterar o tamanho da imagem em variável TAMANHO deste script. Esse script deve ser executado antes de iniciar os serviços via docker-compose.
docker-compose.yml: docker-compose com a configuração dos serviços linuxserver_nextcloud_db(define a configuração do banco de dados, com variável de ambiente para definir o usuário, senha e nome do banco) e linuxserver_nextcloud(define o conteiner para o Nextcloud).
up.sh: Inicia os serviços do banco de dados MariaDB e do NextCloud integrados. Também monta o volume BTRFS em pasta 'data'.
down.sh: Desmonta o volume BTRFS e finaliza os serviços citados acima.
mount_volume.sh e umount_volume.sh: Monta e desmonta o volume BTRFS de pasta 'data'. Scripts usados internamente pelos scripts up.sh e down.sh.
ps.sh: Lista os serviços associados ao docker-compose.yml, exibindo seu estado.
gerar_servico.sh: Script para gerar o serviço 'linuxserver_nextcloud.service' para usar os conteineres
como um serviço do systemctl. Gera os arquivo 'linuxserver_nextcloud_up.sh', 'linuxserver_nextcloud_down.sh' e 'linuxserver_nextcloud.service'.
.gitignore: arquivo com as excessões para o git.
fontes.txt: links associados a esse projeto.

```