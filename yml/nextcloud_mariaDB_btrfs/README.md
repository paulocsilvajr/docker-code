# Docker-compose para configurar um conteiner Nextcloud configurado com o banco de dados MariaDB e com volume em arquivo formatado como BTRFS

Este repositório cria um conteiner Docker do [NextCloud](https://nextcloud.com/) baseado nos modelos apresentados no [Docker Hub do NextCloud](https://hub.docker.com/_/nextcloud). Para isolar o armazenamento, foi criado um arquivo formatado como BTRFS, com armazenamento de 20GB. Esse arquivo é montado, por padrão, na pasta 'data' do diretório atual. Com o formato BTRFS do volume é possivel criar snapshots dos subvolumes 'db' e 'nextcloud'.

## Arquivos
```
docker-compose.yml: arquivo com a descrição dos serviços db(banco de dados MariaVM) e app(nextcloud). Nextcloud inicializa na porta 8082. Defina o usuário e senha do MariaBM de acordo com as variáveis correspondentes.
create_volume_btrfs.sh: cria um arquivo de 20GiB na pasta atual denominado 'volume.img' e o formata para BTRFS. Pode-se alterar seu tamanho na constante TAMANHO do script.
up.sh: Script para montar a imagem 'volume.img' na pasta atual, dentro de 'data' e inicializar os serviços do banco de dados(db) e nextcloud(app). Imagem 'volume.img' deve existir para executar esse script.
down.sh: Script para desmontar a imagem montada em './data' e finalizar os serviços db e app.
log_mariadb.sh e log_nextcloud.sh: Script para visualizar o log dos servidos db e app, consecutivamente.
mount_volume.sh: Script para montar a imagem 'volume.img' em './data'. Usado pelo script 'up.sh'.
umount_volume.sh: Script para desmontar o volume montado em './data'. Usado pelo script 'down.sh'.
fonte.txt: link de fonte base para docker-compose.yml do Nextcloud.
.gitignore: arquivo de arquivos/pastas que devem ser ignoradas pelo git. Por padrão. deve-se ignorar a pasta 'data' e o arquivo 'volume.img'.
```
