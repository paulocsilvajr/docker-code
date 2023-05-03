# Docker-compose para configurar um conteiner Nextcloud configurado com o banco de dados MariaDB, com volume em arquivo formatado como BTRFS e gerenciado via serviço do Systemd.

Este repositório cria um conteiner Docker do [NextCloud](https://nextcloud.com/), baseado nos modelos apresentados no [Docker Hub do NextCloud](https://hub.docker.com/_/nextcloud), e um conteiner MariaDB para o banco de dados. Para isolar o armazenamento, foi criado um arquivo formatado como BTRFS, com armazenamento de 20GiB. Esse arquivo é montado, por padrão, na pasta 'data' do diretório atual. Com o formato BTRFS do volume é possivel criar snapshots dos subvolumes 'db' e 'nextcloud'.

Nextcloud disponível em **http:\\localhost:8082** após sua montagem via docker-compose.

Deve-se usar os scripts *up.sh* e *down.sh* para inicializar e parar os serviços, porque estes montam e desmontam o volume virtual da imagem BTRFS em pasta *data*.

Foi criado scripts para usar esses conteineres como serviços do Systemd. Pare os conteineres com o script *down.sh* e use o script *gerar_servico.sh* para criar o serviço do sistema. Use o comando *systemctl*(start|status|stop) para gerenciar o servico **nextcloud-btrfs.service**.


## Arquivos
```
create_volume_btrfs.sh: Cria uma imagem com 20GiB de tamanho e formatado como BTRFS. Pode-se alterar o tamanho da imagem em variável TAMANHO deste script. Esse script deve ser executado antes de iniciar os serviços via docker-compose.

docker-compose.yml: docker-compose com a configuração dos serviços nextcloud-btrfs-db(define a configuração do banco de dados, com variável de ambiente para definir o usuário, senha e nome do banco) e nextcloud-btrfs-app(define o conteiner para o Nextcloud, possui variáveis para comunicação com o BD).

up.sh: Inicia os serviços do banco de dados MariaDB e do NextCloud integrados. Também monta o volume BTRFS em pasta 'data'.

down.sh: Desmonta o volume BTRFS e finaliza os serviços citados acima.

mount_volume.sh e umount_volume.sh: Monta e desmonta o volume BTRFS de pasta 'data'. Scripts usados internamente pelos scripts up.sh e down.sh.

ps.sh: Lista os serviços associados ao docker-compose.yml, exibindo seu estado.

gerar_servico.sh: Script para gerar o serviço 'nextcloud-btrfs.service' para usar os conteineres
como um serviço do Systemd. Gera os arquivo 'nextcloud-btrfs_up.sh', 'nextcloud-btrfs_down.sh' e 'nextcloud-btrfs.service'.

remover_servico.sh: Para e remove o serviço 'nextcloud-btrfs.service' do Systemd.

log_mariadb.sh e log_nextcloud.sh: Exibe o log(últimas 30 linhas) dos serviços do NextCloud e MariaDB.

.gitignore: arquivo com as excessões para o git.

fontes.txt: links associados a esse projeto.
```
